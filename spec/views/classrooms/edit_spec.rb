require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/classrooms/edit.html.erb" do
  include ClassroomsHelper
  
  before do
    @classroom = mock_model(Classroom)
    @classroom.stub!(:name).and_return("MyString")
    assigns[:classroom] = @classroom

    template.should_receive(:object_url).twice.and_return(classroom_path(@classroom)) 
    template.should_receive(:collection_url).and_return(classrooms_path) 
  end

  it "should render edit form" do
    render "/classrooms/edit.html.erb"
    
    response.should have_tag("form[action=#{classroom_path(@classroom)}][method=post]") do
      with_tag('input#classroom_name[name=?]', "classroom[name]")
    end
  end
end


