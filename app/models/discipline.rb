class Discipline < ActiveRecord::Base
  belongs_to :course
  has_and_belongs_to_many :can_be_taught_by, :class_name => 'Teacher'
  has_many :classes
  
  def to_s
    name
  end
end
