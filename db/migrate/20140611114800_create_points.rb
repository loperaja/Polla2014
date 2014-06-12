class CreatePoints < ActiveRecord::Migration
  def change
    create_table :points do |t|
      t.integer :polla_id
      t.integer :ponts

      t.timestamps
    end
  end
end
