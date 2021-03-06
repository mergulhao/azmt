require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClassesHelper do
  describe ".title" do
    it "should return title" do
      string = "Classes"
      helper.should_receive(:_).with(string).and_return(string)
      helper.title.should eql(string)
    end
  end
end
