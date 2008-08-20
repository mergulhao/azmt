require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Course do
  before(:each) do
    @course = Course.new
  end

  it "should not be valid" do
    @course.should_not be_valid

    error_messages = ["Name can't be blank", "Color can't be blank"]
    @course.errors.full_messages.should eql(error_messages)
  end
end
