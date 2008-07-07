require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Classroom do
  fixtures :classrooms
  
  before(:each) do
    @classroom = Classroom.new
  end

  it "should be valid" do
    @classroom.should be_valid
  end

  describe ".to_s" do
    it "should return the classroom name" do 
      classrooms(:amazonia).to_s.should eql('Amazônia')
      classrooms(:amazonia).name.should eql('Amazônia')
    end
  end
end
