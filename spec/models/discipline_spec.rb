require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Discipline do
  fixtures :disciplines
  
  before(:each) do
    @discipline = disciplines(:math)
  end
  
  it "should not be valid" do
    @discipline = Discipline.new
    @discipline.should_not be_valid
      
    error_messages = ["Name can't be blank", "Lessons number can't be blank", "Lessons number is not a number"]
    @discipline.errors.full_messages.should eql(error_messages)
  end
  
  it "should not validate not numerical lessons number" do
    @discipline.lessons_number = 'jaca'
    @discipline.should_not be_valid
    @discipline.errors.on(:lessons_number).should eql('is not a number')
  end
  
  it "should not validate lessons number greater than 0" do
    @discipline.lessons_number = -1
    @discipline.should_not be_valid
    @discipline.errors.on(:lessons_number).should eql('must be greater than 0')
  end
    
  it "should return name" do
    @discipline.to_s.should eql("Math")
  end
end
