module MatchResultsHelper
  
  def row_ids
    @open_row_ids = Array.new
    ['A', 'C', 'E', 'G'].each {|g| @open_row_ids << Group.where('name = ?', g).first.matches.first.id}
    @close_row_ids = Array.new
    ['B', 'D', 'F', 'H'].each {|g| @close_row_ids << Group.where('name = ?', g).first.matches.first.id}
    @open_widget_ids = Array.new
    Group.all.collect(&:name).each {|g| @open_widget_ids << Group.where('name = ?', g).first.matches.first.id}
    @close_widget_ids = Array.new
    Group.all.collect(&:name).each {|g| @close_widget_ids << Group.where('name = ?', g).first.matches.last.id}   
  end
end
