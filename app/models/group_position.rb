class GroupPosition < ActiveRecord::Base
  belongs_to :position
  belongs_to :team
  belongs_to :polla
  belongs_to :group
  
  validates :polla_id, uniqueness: {scope: :team_id}
  validates :position_id, uniqueness: {scope: [:group_id, :polla_id, :team_id], message: "no puede ser la misma para dos equipos del mismo grupo"}, on: :update
  
  default_scope order('team_id ASC')
  
end
