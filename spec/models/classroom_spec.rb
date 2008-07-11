require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Classroom do
  fixtures :classrooms
  
  before(:each) do
    @classroom = Classroom.new
  end

  it "should be invalid" do
    @classroom.should_not be_valid
    
    @classroom.errors_on(:name).should eql(["can't be blank"])
    @classroom.errors_on(:capacity).should eql(["is not a number"])
  end

  describe ".to_s" do
    it "should return the classroom name" do 
      classrooms(:amazonia).to_s.should eql('Amazônia')
      classrooms(:amazonia).name.should eql('Amazônia')
    end
  end
end
