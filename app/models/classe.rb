class Classe < ActiveRecord::Base
  belongs_to :course
  has_many :lessons, :order => 'date'

  validates_presence_of :course
#  validates_associated :lessons

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
