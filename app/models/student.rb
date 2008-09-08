class Student < ActiveRecord::Base
  validates_presence_of :name
  has_many :contracts, :order => 'created_at ASC'
end
