class Position < ActiveRecord::Base
  has_many :group_positions
  has_many :pollas, through: :final_positions
  has_many :final_positions
end
