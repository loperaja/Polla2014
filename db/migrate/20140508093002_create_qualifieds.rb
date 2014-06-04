class CreateQualifieds < ActiveRecord::Migration
  def change
    create_table :qualifieds do |t|
      t.integer :polla_id
      t.integer :team_id
      t.integer :round_id

      t.timestamps
    end
  end
end
