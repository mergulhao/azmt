class Lesson < ActiveRecord::Base
  extend Forwardable
  belongs_to :classe
  belongs_to :classroom
  
  def_delegators :classe, :teacher, :teacher_id, :discipline
  
  def to_s
    "#{discipline} - #{name}"
  end
  
  def to_calendar
    "#{start_time.strftime('%H:%M')} - #{to_s}"
  end
end
