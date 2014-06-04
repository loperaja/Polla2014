class RenamePostitionIdToPositionIdOnGroupPositions < ActiveRecord::Migration
  def up
    rename_column :group_positions, :postition_id, :position_id
  end
end
