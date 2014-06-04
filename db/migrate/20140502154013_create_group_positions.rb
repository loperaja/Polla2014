class CreateGroupPositions < ActiveRecord::Migration
  def change
    create_table :group_positions do |t|
      t.integer :polla_id
      t.integer :team_id
      t.integer :postition_id

      t.timestamps
    end
  end
end
