require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Course do
  fixtures :courses
  
  before(:each) do
    @course = Course.new
  end

  it "should not be valid" do
    @course.should_not be_valid

    error_messages = ["Name can't be blank", "Color can't be blank"]
    @course.errors.full_messages.should eql(error_messages)
  end

  describe ".to_s" do
    it "should return name" do
      course = courses(:math)
      course.to_s.should eql('Math complete')
      course.name.should eql('Math complete')
      
      course = courses(:sexology)
      course.to_s.should eql('Sexology in details')
      course.name.should eql('Sexology in details')
    end
  end
end
