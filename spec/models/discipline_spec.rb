require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Discipline do
  before(:each) do
    @discipline = Discipline.new
  end

  it "should be valid" do
    @discipline.should be_valid
  end
end
