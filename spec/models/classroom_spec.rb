require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Classroom do
  before(:each) do
    @classroom = Classroom.new
  end

  it "should be valid" do
    @classroom.should be_valid
  end
end
