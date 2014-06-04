class AddIndexToFinalPositions < ActiveRecord::Migration
  def change
    add_index :final_positions, [:position_id, :polla_id, :team_id], unique: true
  end
end
