class Polla < ActiveRecord::Base
  validates :name, presence: true
  belongs_to :user
  has_many :matches, through: :match_results
  has_many :match_results, dependent: :destroy
  has_many :group_positions, dependent: :destroy
  has_many :rounds, through: :qualifieds
  has_many :qualifieds, dependent: :destroy
  has_many :positions, through: :final_positions
  has_many :final_positions, dependent: :destroy
  has_many :points, dependent: :destroy
  has_many :point_histories, dependent: :destroy  
  
  after_create :build_polla
  
  after_update :add_points
  
  attr_accessor :polla_section
  attr_accessor :round_id
  
  accepts_nested_attributes_for :match_results, allow_destroy: true
  accepts_nested_attributes_for :group_positions, allow_destroy: true
  accepts_nested_attributes_for :qualifieds, allow_destroy: true
  accepts_nested_attributes_for :final_positions, allow_destroy: true
  
  private
  
  def add_points
    if self.real?
      self.match_results.where('match_results.winner IS NOT ? OR match_results.draw IS NOT ?', nil, nil).each do |match|
        Polla.where(real: nil).each do |polla|
          unless PointHistory.where('polla_id = ? AND match_id = ?', polla.id, match.match_id).any?
            polla_match = polla.match_results.where(match_id: match.match_id).first
            polla_match.draw? ? polla_result = 'e' : polla_result = polla_match.winner
            match.draw? ? real_result = 'e' : real_result = match.winner
            if polla_result == real_result
              sum_points(polla, 1)
              PointHistory.create!(polla_id: polla.id, match_id: match.match_id, points: @new_score)
            end          
          end
        end
      end
      self.group_positions.where('group_positions.position_id is NOT ?', nil).each do |position|
        Polla.where(real: nil).each do |polla|
          unless PointHistory.where('polla_id = ? AND group_position_id = ?', polla.id, position.id).any?
            if polla.group_positions.where('group_positions.team_id = ? AND group_positions.position_id = ?', position.team_id, position.position_id).any?
              sum_points(polla, 1)
              PointHistory.create!(polla_id: polla.id, group_position_id: position.id, points: @new_score)
            end
          end  
        end        
      end
      qualifieds_score(1, 2, self.qualifieds)
      qualifieds_score(2, 5, self.qualifieds)
      qualifieds_score(3, 7, self.qualifieds)
      
      self.final_positions.where('final_positions.team_id is NOT ?', nil).each do |final_position|
        Polla.where(real: nil).each do |polla|
          unless PointHistory.where('polla_id = ? AND final_position_id = ?', polla.id, final_position.id).any?
            if polla.final_positions.where('final_positions.team_id = ? AND final_positions.position_id = ?', final_position.team_id, final_position.position_id).any?
              sum_points(polla, 10)
              PointHistory.create!(polla_id: polla.id, final_position_id: final_position.id, points: @new_score)
            end
          end
        end
      end      
    end
  end
  
  def qualifieds_score(round_id, score, qualif)
    qualif.where('qualifieds.round_id = ? AND qualifieds.team_id IS NOT ?', round_id, nil).each do |qualified|
      Polla.where(real: nil).each do |polla|
        unless PointHistory.where('polla_id = ? AND qualified_id = ?', polla.id, qualified.id).any?
          if polla.qualifieds.where('round_id = ? AND team_id = ?', round_id, qualified.team_id).any?
            sum_points(polla, score)
            PointHistory.create!(polla_id: polla.id, qualified_id: qualified.id, points: @new_score)
          end
        end
      end
    end
  end
  
  def sum_points(polla, scored)
    Point.create!(polla_id: polla.id) unless Point.where(polla_id: polla.id).any?
    polla_points = Point.where(polla_id: polla.id).first 
    current_score = polla_points.points.nil? ? 0 : polla_points.points
    polla_points.update_attributes(points: current_score + scored)
    @new_score = current_score + scored
  end
    
    
    def build_polla
      Match.all.each {|m| self.match_results.create(match_id: m.id)}
      Group.all.each do |g|
        g.teams.each{|t| self.group_positions.create(group_id: g.id, team_id: t.id)}
      end
      Round.all.each{|r| r.number_of_teams.times{self.qualifieds.create(round_id: r.id)}}
      Position.all.each{|p| self.final_positions.create(position_id: p.id)}
    end
  
end
