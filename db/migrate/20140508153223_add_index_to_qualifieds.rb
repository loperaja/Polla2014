class AddIndexToQualifieds < ActiveRecord::Migration
  def change
    add_index :qualifieds, [:polla_id, :team_id, :round_id], unique: true
  end
end
