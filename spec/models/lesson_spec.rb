require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lesson do
  fixtures :classrooms, :teachers, :disciplines, :lessons, :classes
  
  before(:each) do
    @lesson = Lesson.new
  end

  it "should not be valid" do
    @lesson.should_not be_valid
    errors = ["Classroom can't be blank", "Classe can't be blank"]
    @lesson.errors.full_messages.should eql(errors)
  end
  
  it "should respond to teacher" do
    lessons(:trigonometry).teacher.should eql(teachers(:marge))
  end
  
  it "should respond to classroom" do
    lessons(:trigonometry).classroom.should eql(classrooms(:amazonia))
  end
  
  describe ".to_s" do
    it "should return the lesson name" do 
      lessons(:trigonometry).to_s.should eql('Math - Trigonometry')
      lessons(:trigonometry).name.should eql('Trigonometry')
    end
  end
  
  describe ".to_calendar" do 
    it "should return calendar_entry" do
      lessons(:trigonometry).to_calendar.should eql('18:00 - Math - Trigonometry')
    end
  end
end
