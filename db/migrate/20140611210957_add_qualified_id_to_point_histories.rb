class AddQualifiedIdToPointHistories < ActiveRecord::Migration
  def change
    add_column :point_histories, :qualified_id, :integer
  end
end
