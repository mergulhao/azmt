require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Course do
  before(:each) do
    @course = Course.new
  end

  it "should be valid" do
    @course.should be_valid
  end
end
