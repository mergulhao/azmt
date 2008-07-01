require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Discipline do
  fixtures :disciplines
  
  before(:each) do
    @discipline = disciplines(:math)
  end

  it "should be valid" do
    @discipline.should be_valid
  end
  
  it "should return name" do
    @discipline.to_s.should eql("Math")
  end
end
