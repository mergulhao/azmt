class Lesson < ActiveRecord::Base
  extend Forwardable
  belongs_to :classe
  belongs_to :classroom

  validates_presence_of :classe
  validates_presence_of :classroom
  
  validates_date :date
  validates_time :start_time
  validates_time :end_time, :after => :start_time
  
  def_delegators :classe, :teacher, :teacher_id, :discipline

  def to_s
    "#{discipline} - #{name}"
  end
  
  def to_calendar
    "#{start_time.strftime('%H:%M')} - #{to_s}"
  end
end
