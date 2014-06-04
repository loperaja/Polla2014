class AddIndexToGroupPositions < ActiveRecord::Migration
  def change
    add_index :group_positions, [:polla_id, :position_id, :group_id], unique: true
  end
end
