class AddNumberOfTeamsToRounds < ActiveRecord::Migration
  def change
    add_column :rounds, :number_of_teams, :integer
  end
end
