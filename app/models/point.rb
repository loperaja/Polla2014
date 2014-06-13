class Point < ActiveRecord::Base

  
  validates_uniqueness_of :polla_id
  
end
