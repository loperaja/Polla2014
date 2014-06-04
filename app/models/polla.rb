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
  
  after_create :build_polla
  
  attr_accessor :polla_section
  attr_accessor :round_id
  
  accepts_nested_attributes_for :match_results, allow_destroy: true
  accepts_nested_attributes_for :group_positions, allow_destroy: true
  accepts_nested_attributes_for :qualifieds, allow_destroy: true
  accepts_nested_attributes_for :final_positions, allow_destroy: true
  
  private
  
    def build_polla
      Match.all.each {|m| self.match_results.create(match_id: m.id)}
      Group.all.each do |g|
        g.teams.each{|t| self.group_positions.create(group_id: g.id, team_id: t.id)}
      end
      Round.all.each{|r| r.number_of_teams.times{self.qualifieds.create(round_id: r.id)}}
      Position.all.each{|p| self.final_positions.create(position_id: p.id)}
    end
  
end
