require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/courses/new.html.erb" do
  include CoursesHelper
  
  before(:each) do
    @course = mock_model(Course)
    @course.stub!(:new_record?).and_return(true)
    @course.stub!(:name).and_return("MyString")
    @course.stub!(:color).and_return("MyString")
    assigns[:course] = @course


    template.stub!(:object_url).and_return(course_path(@course)) 
    template.stub!(:collection_url).and_return(courses_path) 
  end

#  it "should render new form" do
#    render "/courses/new.html.erb"
#    
#    response.should have_tag("form[action=?][method=post]", courses_path) do
#      with_tag("input#course_name[name=?]", "course[name]")
#      with_tag("input#course_color[name=?]", "course[color]")
#    end
#  end
end


