class AddGroupIdToMatches < ActiveRecord::Migration
  def change
    add_column :matches, :group_id, :integer
  end
end
