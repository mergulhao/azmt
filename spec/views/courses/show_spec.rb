require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/courses/show.html.erb" do
  include CoursesHelper
  
  before(:each) do
    @course = mock_model(Course)
    @course.stub!(:name).and_return("MyString")
    @course.stub!(:color).and_return("MyString")

    assigns[:course] = @course

    template.stub!(:edit_object_url).and_return(edit_course_path(@course)) 
    template.stub!(:collection_url).and_return(courses_path) 
  end

  it "should render attributes in <p>" do
    render "/courses/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

