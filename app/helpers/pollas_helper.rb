module PollasHelper

  def row_ids
    @open_row_ids = Array.new
    ['A', 'C', 'E', 'G'].each {|g| @open_row_ids << Group.where('name = ?', g).first.matches.first.id}
    @close_row_ids = Array.new
    ['B', 'D', 'F', 'H'].each {|g| @close_row_ids << Group.where('name = ?', g).first.matches.first.id}
    @open_widget_ids = Array.new
    Group.all.collect(&:name).each {|g| @open_widget_ids << Group.where('name = ?', g).first.matches.first.id}
    @close_widget_ids = Array.new
    Group.all.collect(&:name).each {|g| @close_widget_ids << Group.where('name = ?', g).first.matches.last.id}
    
    @open_row_positions = Array.new
    ['A', 'C', 'E', 'G'].each {|g| @open_row_positions << Group.where('name = ?', g).first.teams.first.id }
    @close_row_positions = Array.new
    ['B', 'D', 'F', 'H'].each {|g| @close_row_positions << Group.where('name = ?', g).first.teams.last.id}
    @open_widget_positions = Array.new
    Group.all.each {|g| @open_widget_positions << g.teams.first.id}
    @close_widget_positions = Array.new
    Group.all.each {|g| @close_widget_positions << g.teams.last.id}
    
    @qualifieds_open = [0, 3, 6, 9, 12, 15]
    @qualifieds_close = [2, 5, 8, 11, 14, 15]
  
  end
  
  
  def percentage_completed(polla)
    total_matches = 48
    total_positions = 32
    total_qualifieds = 28
    total_final = 4
    results = polla.match_results.where('match_results.winner IS NOT ? OR match_results.draw IS NOT ?', nil, nil).count
    positions = polla.group_positions.where('position_id IS NOT ?', nil).count
    qualifieds = polla.qualifieds.where('team_id IS NOT ?', nil).count
    final = polla.final_positions.where('team_id IS NOT ?', nil).count
    
    total = total_matches + total_positions + total_qualifieds + total_final
    total_completed = results + positions + qualifieds + final
    
    percentage_completed = (total_completed * 100.0)/total
    return percentage_completed
  end
  
  def results_completed(polla)
    total_matches = 48    
    results = polla.match_results.where('match_results.winner IS NOT ? OR match_results.draw IS NOT ?', nil, nil).count      
    percentage_completed = (results * 100.0)/total_matches
    return percentage_completed
  end
  
  def group_positions_completed(polla)

    total_positions = 32
    positions = polla.group_positions.where('position_id IS NOT ?', nil).count
       
    percentage_completed = (positions * 100.0)/total_positions
    return percentage_completed
  end
  
  def qualifieds_completed(polla)
    total_qualifieds = 28
    qualifieds = polla.qualifieds.where('team_id IS NOT ?', nil).count    
    percentage_completed = (qualifieds * 100.0)/total_qualifieds
    return percentage_completed
  end
  
  def final_completed(polla)
    total_final = 4
    final = polla.final_positions.where('team_id IS NOT ?', nil).count
  
    percentage_completed = (final * 100.0)/total_final
    return percentage_completed
  end
  
  

end
