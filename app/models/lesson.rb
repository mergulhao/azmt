class Lesson < ActiveRecord::Base
  belongs_to :discipline
  
  def to_s
    name
  end
  
  def to_calendar
    "#{datetime_start.strftime('%H:%M')} - #{name}"
  end
end
