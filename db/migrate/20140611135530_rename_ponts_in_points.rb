class RenamePontsInPoints < ActiveRecord::Migration
  def change
    rename_column :points, :ponts, :points
  end
end
