class Discipline < ActiveRecord::Base
  belongs_to :teacher
  belongs_to :classroom
  has_many :lessons
  
  def to_s
    name
  end
end
