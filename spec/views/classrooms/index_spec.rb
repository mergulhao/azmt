require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/classrooms/index.html.erb" do
  include ClassroomsHelper
  
  before(:each) do
    classroom_98 = mock_model(Classroom)
    classroom_98.should_receive(:name).and_return("MyString")
    classroom_99 = mock_model(Classroom)
    classroom_99.should_receive(:name).and_return("MyString")

    assigns[:classrooms] = [classroom_98, classroom_99]

    template.stub!(:object_url).and_return(classroom_path(@classroom)) 
    template.stub!(:new_object_url).and_return(new_classroom_path) 
    template.stub!(:edit_object_url).and_return(edit_classroom_path(@classroom)) 
  end

  it "should render list of classrooms" do
    render "/classrooms/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

