task :create_groups => :environment do
  group_array = ["A","B","C","D","E","F","G","H",]
  group_array.each {|i| Group.create!(name: i)}  
end

task :create_teams => :environment do
  teams_array = [    
    "Brasil",
    "Croacia",
    "México",
    "Camerún",
    "España",
    "Holanda",
    "Chile",
    "Australia",
    "Colombia",
    "Grecia",
    "Costa de Marfil",
    "Japón",
    "Uruguay",
    "Costa Rica",
    "Inglaterra",
    "Italia",
    "Suiza",
    "Ecuador",
    "Francia",
    "Honduras",
    "Argentina",
    "Bosnia",
    "Irán",
    "Nigeria",
    "Alemania",
    "Portugal",
    "Ghana",
    "Estados Unidos",
    "Bélgica",
    "Argelia",
    "Rusia",
    "Corea del Sur"]
    group_id = 1
    teams_array.each_with_index do |team, index|
      group_id = group_id + 1 if index % 4 == 0 && index != 0
      Team.create!(name: team, group_id: group_id)
    end   
end

task :create_matches => :environment do
  Group.all.each do |g|
    Team.where('group_id = ?', g.id).collect(&:id).combination(2).to_a.each {|ids| Match.create!(team_ids: ids)}
  end
end

task :add_groups_to_matches => :environment do
  Match.all.each{|m| m.update_attributes(:group_id => m.match_details.first.team.group.id)}
end

task :create_positions => :environment do
  ['Primero', 'Segundo', 'Tercero', 'Cuarto'].each {|p| Position.create!(name: p)} 
end

task :create_rounds => :environment do
  [{name: 'Segunda Ronda',no: 16}, {name: 'Cuartos de Final', no: 8}, {name: 'Semifinales', no: 4}].each {|r| Round.create!(name: r[:name], number_of_teams: r[:no])}
end

task :short_names => :environment do
  teams_array = [    
    "Bra",
    "Cro",
    "Mex",
    "Cam",
    "Esp",
    "Hol",
    "Chi",
    "Aus",
    "Col",
    "Gre",
    "Cmf",
    "Jap",
    "Uru",
    "Crc",
    "Ing",
    "Ita",
    "Sui",
    "Ecu",
    "Fra",
    "Hon",
    "Arg",
    "Bos",
    "Irn",
    "Nig",
    "Ale",
    "Por",
    "Gha",
    "USA",
    "Bel",
    "Agl",
    "Rus",
    "Cor"]
    teams_array.each_with_index do |abbr, i|
      Team.find(i+1).update_attributes(shortname: abbr)
    end   
end
