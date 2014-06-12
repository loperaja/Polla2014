class CreatePointHistories < ActiveRecord::Migration
  def change
    create_table :point_histories do |t|
      t.integer :polla_id
      t.integer :points
      t.integer :match_id
      t.integer :group_position_id
      t.integer :round_id
      t.integer :final_position_id

      t.timestamps
    end
  end
end
