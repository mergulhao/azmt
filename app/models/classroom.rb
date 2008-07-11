class Classroom < ActiveRecord::Base
  validates_presence_of :name
  validates_numericality_of :capacity, :allow_nil => false, :greater_than => 0
  
  def to_s
    name
  end
end
