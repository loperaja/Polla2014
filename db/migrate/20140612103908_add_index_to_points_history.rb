class AddIndexToPointsHistory < ActiveRecord::Migration
  def change
    add_index :point_histories, :polla_id
    add_index :point_histories, :match_id
    add_index :point_histories, :group_position_id
    add_index :point_histories, :round_id
    add_index :point_histories, :final_position_id
    add_index :points, :polla_id
  end
end
