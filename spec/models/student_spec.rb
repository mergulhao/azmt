require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Student do
  before(:each) do
    @student = Student.new
  end

  it "should validate name" do
    @student.valid?
    @student.errors.on(:name).should eql("can't be blank")
  end
end
