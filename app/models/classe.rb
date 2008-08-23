class Classe < ActiveRecord::Base
  belongs_to :course
  has_many :lessons

  validates_presence_of :course
  validates_associated :lessons

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
#        date = attributes.delete("date")
#        start_time = attributes.delete("start_time")
#        end_time = attributes.delete("end_time")
        lesson.attributes = attributes
#        lesson.date = date
#        lesson.start_time = start_time
#        lesson.end_time = end_time
      else
        lessons.destroy(lesson)
      end
    end
  end

  def save_lessons
    lessons.each do |lesson|
      lesson.save
    end
  end

  def to_s
    #    "#{course} with #{teacher}, start date: #{start_date.to_s_br}"
    "#{course} bla =P"
  end
end
