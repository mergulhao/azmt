require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Lesson do
  before(:each) do
    @lesson = Lesson.new
  end

  it "should be valid" do
    @lesson.should be_valid
  end
end
