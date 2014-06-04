class AddIndexesNineMay < ActiveRecord::Migration
  def change
    add_index :group_positions, [:polla_id, :team_id, :position_id], unique: true
    add_index :group_positions, :polla_id
    add_index :group_positions, :group_id
    add_index :group_positions, :position_id
    add_index :group_positions, :team_id
    add_index :final_positions, :polla_id
    add_index :final_positions, :team_id
    add_index :final_positions, :position_id
    add_index :match_details, :match_id
    add_index :match_details, :team_id
    add_index :match_results, :winner
    add_index :match_results, :polla_id
    add_index :match_results, :match_id
    add_index :qualifieds, :team_id
    add_index :qualifieds, :round_id
    add_index :qualifieds, :polla_id
    add_index :pollas, :user_id, unique: true
    add_index :match_details, [:match_id, :team_id], unique: true 
  end
end
