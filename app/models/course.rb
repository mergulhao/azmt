class Course < ActiveRecord::Base
  has_many :disciplines
  
  validates_presence_of :name, :color
end
