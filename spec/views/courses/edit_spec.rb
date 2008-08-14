require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/courses/edit.html.erb" do
  include CoursesHelper
  
  before do
    @course = mock_model(Course)
    @course.stub!(:name).and_return("MyString")
    @course.stub!(:color).and_return("MyString")
    assigns[:course] = @course

    template.should_receive(:object_url).twice.and_return(course_path(@course)) 
    template.should_receive(:collection_url).and_return(courses_path) 
  end

#  it "should render edit form" do
#    render "/courses/edit.html.erb"
#    
#    response.should have_tag("form[action=#{course_path(@course)}][method=post]") do
#      with_tag('input#course_name[name=?]', "course[name]")
#      with_tag('input#course_color[name=?]', "course[color]")
#    end
#  end
end


