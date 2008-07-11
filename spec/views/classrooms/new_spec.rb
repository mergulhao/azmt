require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/classrooms/new.html.erb" do
  include ClassroomsHelper
  
  before(:each) do
    @classroom = mock_model(Classroom)
    @classroom.stub!(:new_record?).and_return(true)
    @classroom.stub!(:name).and_return("MyString")
    assigns[:classroom] = @classroom


    template.stub!(:object_url).and_return(classroom_path(@classroom)) 
    template.stub!(:collection_url).and_return(classrooms_path) 
  end

#  it "should render new form" do
#    render "/classrooms/new.html.erb"
#    
#    response.should have_tag("form[action=?][method=post]", classrooms_path) do
#      with_tag("input#classroom_name[name=?]", "classroom[name]")
#    end
#  end
end


