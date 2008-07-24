class Teacher < ActiveRecord::Base
  has_and_belongs_to_many :can_teach, :class_name => 'Discipline'
  
  def to_s
    name
  end
end
