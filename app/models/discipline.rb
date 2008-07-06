class Discipline < ActiveRecord::Base
  belongs_to :teacher
  has_many :lessons
  
  def to_s
    name
  end
end
