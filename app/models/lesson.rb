class Lesson < ActiveRecord::Base
  extend Forwardable

  belongs_to :classe
  belongs_to :classroom
  belongs_to :discipline
  belongs_to :teacher
  
  validates_presence_of :classe, :classroom, :discipline, :teacher
  
  validates_date :date
  validates_time :start_time
  validates_time :end_time, :after => :start_time
  
  def to_s
    "#{discipline} - #{name}"
  end
  
  def to_calendar
    "#{start_time.strftime('%H:%M')} - #{to_s}"
  end
end
