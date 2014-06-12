class Point < ActiveRecord::Base
  belongs_to :polla
  
  validates_uniqueness_of :polla_id
  
end
