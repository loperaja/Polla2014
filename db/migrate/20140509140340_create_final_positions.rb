class CreateFinalPositions < ActiveRecord::Migration
  def change
    create_table :final_positions do |t|
      t.integer :polla_id
      t.integer :team_id
      t.integer :position_id

      t.timestamps
    end
  end
end
