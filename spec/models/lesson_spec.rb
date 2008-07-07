require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lesson do
  fixtures :classrooms, :teachers, :disciplines, :lessons
  
  before(:each) do
    @lesson = Lesson.new
  end

  it "should be valid" do
    @lesson.should be_valid
  end
  
  it "should respond to teacher" do
    lessons(:trigonometry).teacher.should eql(teachers(:marge))
  end
  
  it "should respond to classroom" do
    lessons(:trigonometry).classroom.should eql(classrooms(:amazonia))
  end
  
  it "should validates datetime_start day/month/year must be the same as datetime_end" do
    lesson = Lesson.new :datetime_start => Time.now - 1.day, :datetime_end => Time.now
    lesson.valid?.should be(false)
    lesson.errors.full_messages.should eql(["Aulas devem começar e acabar no mesmo dia"])
  end
  
  describe ".to_s" do
    it "should return the lesson name" do 
      lessons(:trigonometry).to_s.should eql('Trigonometry')
      lessons(:trigonometry).name.should eql('Trigonometry')
    end
  end
  
  describe ".to_calendar" do 
    it "should return calendar_entry" do
      lessons(:trigonometry).to_calendar.should eql('18:00 - Trigonometry')
    end
  end
end
