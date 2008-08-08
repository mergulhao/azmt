require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LessonsHelper do
  describe ".title" do
    it "should return title" do
      string = "Lessons"
      helper.should_receive(:_).with(string).and_return(string)
      helper.title.should eql(string)
    end
  end
end
