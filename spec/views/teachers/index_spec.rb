require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/teachers/index.html.erb" do
  include TeachersHelper
  
  before(:each) do
    teacher_98 = mock_model(Teacher)
    teacher_98.should_receive(:name).and_return("MyString")
    teacher_99 = mock_model(Teacher)
    teacher_99.should_receive(:name).and_return("MyString")

    assigns[:teachers] = [teacher_98, teacher_99]

    template.stub!(:object_url).and_return(teacher_path(@teacher)) 
    template.stub!(:new_object_url).and_return(new_teacher_path) 
    template.stub!(:edit_object_url).and_return(edit_teacher_path(@teacher)) 
  end

  it "should render list of teachers" do
    render "/teachers/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

