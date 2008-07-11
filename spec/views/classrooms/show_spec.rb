require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/classrooms/show.html.erb" do
  include ClassroomsHelper
  
  before(:each) do
    @classroom = mock_model(Classroom)
    @classroom.stub!(:name).and_return("MyString")

    assigns[:classroom] = @classroom

    template.stub!(:edit_object_url).and_return(edit_classroom_path(@classroom)) 
    template.stub!(:collection_url).and_return(classrooms_path) 
  end

#  it "should render attributes in <p>" do
#    render "/classrooms/show.html.erb"
#    response.should have_text(/MyString/)
#  end
end

