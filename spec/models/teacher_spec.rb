require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Teacher do
  fixtures :teachers
  
  before(:each) do
    @teacher = teachers(:homer)
  end

  it "should be valid" do
    @teacher.should be_valid
  end

  it "should return name" do
    @teacher.to_s.should eql("Homer J. Simpson")
  end
end
