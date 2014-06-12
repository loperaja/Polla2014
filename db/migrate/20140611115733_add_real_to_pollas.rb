class AddRealToPollas < ActiveRecord::Migration
  def change
    add_column :pollas, :real, :boolean
  end
end
