class RemoveIndexGroupPositionsOnPollaIdAndPositionIdAndGroupId < ActiveRecord::Migration
  def change
    remove_index(:group_positions, name: 'index_group_positions_on_polla_id_and_position_id_and_group_id')
  end
end
