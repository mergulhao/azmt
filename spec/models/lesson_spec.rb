require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lesson do
  fixtures :lessons
  
  before(:each) do
    @lesson = Lesson.new
  end

  it "should be valid" do
    @lesson.should be_valid
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
