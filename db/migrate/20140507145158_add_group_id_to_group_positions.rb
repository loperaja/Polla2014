class AddGroupIdToGroupPositions < ActiveRecord::Migration
  def change
    add_column :group_positions, :group_id, :integer
  end
end
