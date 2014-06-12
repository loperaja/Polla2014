class Match < ActiveRecord::Base
  has_many :teams, through: :match_details
  has_many :match_details, dependent: :destroy
  has_many :points_history, dependent: :destroy 
  
  has_many :pollas, through: :match_results, uniq: true
  has_many :match_results
  
  belongs_to :group
  
  accepts_nested_attributes_for :match_results
end
