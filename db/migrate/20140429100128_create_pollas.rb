class CreatePollas < ActiveRecord::Migration
  def change
    create_table :pollas do |t|
      t.integer :user_id
      t.string :name
      t.boolean :paid

      t.timestamps
    end
  end
end
