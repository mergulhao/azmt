class Classe < ActiveRecord::Base
  belongs_to :course
  belongs_to :classroom
  has_many :lessons, :order => 'date'

  validates_presence_of :course, :name
  validates_date :start_date, :allow_blank => true
  validates_time :start_time, :end_time, :allow_blank => true
#  validates_associated :lessons

  def to_s
    "#{course} - #{name}"
  end
  
  Weekdays = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday' ]
  
  def weekdays=(weekdays_array)
    write_attribute(:weekdays, weekdays_array.map(&:to_s).reject{|w| !Weekdays.include?(w) }.uniq)
  end
  
  def weekdays
    YAML.load(read_attribute(:weekdays))
  rescue TypeError
    []
  end
  
  def new_lesson_attributes=(lesson_attributes)
    lesson_attributes.each do |attributes|
      lessons.build(attributes.merge(:date => attributes[:date].to_date)) # TODO: remove this merge! Understand why 24/05/2008 not parses!
    end
  end

  after_update :save_lessons
  def existing_lesson_attributes=(lesson_attributes)
    lessons.reject(&:new_record?).each do |lesson|
      attributes = lesson_attributes[lesson.id.to_s]
      if attributes
        lesson.attributes = attributes
      else
        lessons.destroy(lesson)
      end
    end
  end

  private
  def save_lessons
    lessons.each do |lesson|
      lesson.save(false)
    end
  end
end
