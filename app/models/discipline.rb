class Discipline < ActiveRecord::Base
  has_many :classes
  
  def to_s
    name
  end
end
