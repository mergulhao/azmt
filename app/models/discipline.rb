class Discipline < ActiveRecord::Base
  has_and_belongs_to_many :courses, :order => 'name'
  has_and_belongs_to_many :can_be_taught_by, :class_name => 'Teacher', :order => 'name'
  
  validates_presence_of :name
  validates_presence_of :lessons_number
  validates_numericality_of :lessons_number, :greater_than => 0
  
  def to_s
    name
  end
end
