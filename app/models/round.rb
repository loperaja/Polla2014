class Round < ActiveRecord::Base

  has_many :pollas, through: :qualifieds
  has_many :qualifieds
  
end
