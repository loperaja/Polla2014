class Group < ActiveRecord::Base
  has_many :teams, :dependent => :destroy
  has_many :matches, :dependent => :destroy
  has_many :group_positions
end
