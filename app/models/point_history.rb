class PointHistory < ActiveRecord::Base
  belongs_to :polla
  belongs_to :match
  belongs_to :group_position
  belongs_to :qualified
  belongs_to :final_position
end
