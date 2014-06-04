class CreateMatchResults < ActiveRecord::Migration
  def change
    create_table :match_results do |t|
      t.integer :user_id
      t.integer :match_id
      t.integer :winner
      t.boolean :draw

      t.timestamps
    end
  end
end
