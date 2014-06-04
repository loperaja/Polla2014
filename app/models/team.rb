class Team < ActiveRecord::Base
  belongs_to :group  
  has_many :match_details, dependent: :destroy
  has_many :matches, through: :match_details
  has_many :match_results, dependent: :destroy
  has_many :group_positions
  has_many :second_round_teams
  has_many :final_positions
end
