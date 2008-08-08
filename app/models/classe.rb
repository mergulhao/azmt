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

  validates_presence_of :discipline, :teacher, :classroom, :lessons_number
  validates_inclusion_of :repeat_on, :in => WeekDays.keys, :on => :create, :message => 'must be a day of week'
  validates_date :start_date
  validates_time :start_time
  validates_time :end_time, :after => :start_time
  validate :verify_if_discipline_can_be_teached_by_the_teacher
  
  def repeat_on=(value)
    write_attribute(:repeat_on, value.to_sym)
  end
  
  def to_s
    "#{discipline} with #{teacher}, start date: #{start_date.to_s_br}"
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
        :classroom => classroom,
        :classe => self)
    end
  end
  
  private
  def verify_if_discipline_can_be_teached_by_the_teacher
    if discipline && !(discipline.can_be_taught_by.include?(teacher))
      errors.add(:teacher_id, 'cannot teach this discipline')
    end
  end
  
  def weekday
    WeekDays[repeat_on.to_sym]
  end
end
