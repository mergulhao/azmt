class Discipline < ActiveRecord::Base
  has_and_belongs_to_many :courses, :order => 'name'
  has_and_belongs_to_many :can_be_taught_by, :class_name => 'Teacher', :order => 'name'
  has_many :classes
  
  def to_s
    name
  end
end
