class MatchResult < ActiveRecord::Base
  belongs_to :team, foreign_key: :winner
  belongs_to :polla
  belongs_to :match
  
  default_scope order('match_id ASC')
  
  def result
    draw? ? 'e' : winner
  end
  
  def result=(result)
    if result.present?
      if result != 'e'
        self.draw = nil
        self.winner = result
      else
        self.draw = true
        self.winner = nil
      end
    end
  end
  
    
end
