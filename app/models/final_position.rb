class FinalPosition < ActiveRecord::Base
  belongs_to :polla
  belongs_to :position
  belongs_to :team
  
  validates :team_id, uniqueness: {scope: [:polla_id, :position_id], message: "No puede aparecer en la lista mas de dos veces"}, on: :update
end
