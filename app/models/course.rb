class Course < ActiveRecord::Base
  has_and_belongs_to_many :disciplines, :order => 'name'
  
  validates_presence_of :name, :color
  
  def to_s
    name
  end
end
