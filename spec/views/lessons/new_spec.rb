require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lessons/new.html.erb" do
  include LessonsHelper
  
  before(:each) do
    @lesson = mock_model(Lesson)
    @lesson.stub!(:new_record?).and_return(true)
    @lesson.stub!(:name).and_return("MyString")
    @lesson.stub!(:discipline_id).and_return("1")
    assigns[:lesson] = @lesson


    template.stub!(:object_url).and_return(lesson_path(@lesson)) 
    template.stub!(:collection_url).and_return(lessons_path) 
  end

#  it "should render new form" do
#    render "/lessons/new.html.erb"
#    
#    response.should have_tag("form[action=?][method=post]", lessons_path) do
#      with_tag("input#lesson_name[name=?]", "lesson[name]")
#    end
#  end
end


