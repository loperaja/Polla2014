class AddPointsToPollas < ActiveRecord::Migration
  def change
    add_column :pollas, :points, :integer
  end
end
