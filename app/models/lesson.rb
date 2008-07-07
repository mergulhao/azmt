class Lesson < ActiveRecord::Base
  extend Forwardable
  belongs_to :discipline
  
  def_delegators :discipline, :teacher, :teacher_id, :classroom, :classroom_id
  
  validate :datetime_start_must_be_same_day_as_datetime_end
  
  def to_s
    name
  end
  
  def to_calendar
    "#{datetime_start.strftime('%H:%M')} - #{name}"
  end
  
  private
  def datetime_start_must_be_same_day_as_datetime_end
    unless self.datetime_start.to_date == self.datetime_end.to_date
      errors.add_to_base('Aulas devem começar e acabar no mesmo dia')
    end
  rescue
    nil
  end
end
