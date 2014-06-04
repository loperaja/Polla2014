class Qualified < ActiveRecord::Base

  belongs_to :polla
  belongs_to :round
  belongs_to :team
  
  validates :team_id, uniqueness: {scope: [:round_id, :polla_id], message: "no puede clasificar más de una vez a alguna ronda"}, on: :update
  
  default_scope order('id ASC')

end
