class ChangeUserIdOnMatchResults < ActiveRecord::Migration
  def up
    rename_column :match_results, :user_id, :polla_id
  end
end
