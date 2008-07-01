class Discipline < ActiveRecord::Base
  belongs_to :teacher
  
  def to_s
    name
  end
end
