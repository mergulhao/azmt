require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/courses/index.html.erb" do
  include CoursesHelper
  
  before(:each) do
    course_98 = mock_model(Course)
    course_98.should_receive(:name).and_return("MyString")
    course_98.should_receive(:color).and_return("MyString")
    course_99 = mock_model(Course)
    course_99.should_receive(:name).and_return("MyString")
    course_99.should_receive(:color).and_return("MyString")

    assigns[:courses] = [course_98, course_99]

    template.stub!(:object_url).and_return(course_path(@course)) 
    template.stub!(:new_object_url).and_return(new_course_path) 
    template.stub!(:edit_object_url).and_return(edit_course_path(@course)) 
  end

#  it "should render list of courses" do
#    render "/courses/index.html.erb"
#    response.should have_tag("tr>td", "MyString", 2)
#    response.should have_tag("tr>td", "MyString", 2)
#  end
end

