require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Teacher do
  before(:each) do
    @teacher = Teacher.new
  end

  it "should be valid" do
    @teacher.should be_valid
  end
end
