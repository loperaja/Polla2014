class User < ActiveRecord::Base
  
  before_save {self.email = email.downcase}
  validates_presence_of :name
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                    format: { with: VALID_EMAIL_REGEX }, 
                    uniqueness: {case_sensitive: false},
                    on: :create
  validates_confirmation_of :email,
                            message: "debe coincidir",
                            on: :create
  
  has_secure_password
  validates :password, length: { minimum: 5 }, on: :create
  
  before_create :create_remember_token
  
  has_many :pollas, dependent: :destroy
  has_many :user_comments, dependent: :destroy
  
  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end
  
  def make_comment(comment)
    user_comments.create!(comment: comment.comment)
  end
  
  def online?
    updated_at > 10.minutes.ago
  end
  
  private 
  
  def create_remember_token
    self.remember_token = User.digest(User.new_remember_token)
  end
  
end
