class RemoveUserIdIndexFromPollas < ActiveRecord::Migration
  def change
    remove_index :pollas, :user_id
    add_index :pollas, :user_id
  end
end
