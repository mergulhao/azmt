class Classe < ActiveRecord::Base
  WeekDays = {
    :sunday => 0,
    :monday => 1, 
    :tuesday => 2,
    :wednesday => 3,
    :thursday => 4, 
    :friday => 5,
    :saturday => 6
  }
  
  belongs_to :discipline
  belongs_to :teacher
  belongs_to :classroom
  has_many :lessons

  validates_presence_of :start_date, :start_time, :end_time, :lessons_number, :on => :create
  validates_inclusion_of :repeat_on, :in => WeekDays.keys, :on => :create, :message => 'must be a day of week'
  
  def repeat_on=(value)
    write_attribute(:repeat_on, value.to_sym)
  end
  
  def after_initialize
    return if start_date.blank? || lessons_number.blank?
    
    if start_date.wday == weekday
      date = start_date - 1.week
    else
      date = start_date
    end
    
    while(lessons.size < lessons_number)
      date = date.end_of_week + weekday.days
      
      lessons << Lesson.new(
        :date => date,
        :start_time => start_time,
        :end_time => end_time,
        :classroom => classroom)
    end
  end
  
  private
  def weekday
    WeekDays[repeat_on.to_sym]
  end
end
