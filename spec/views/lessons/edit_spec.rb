require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lessons/edit.html.erb" do
  include LessonsHelper
  
  before do
    @lesson = mock_model(Lesson)
    @lesson.stub!(:name).and_return("MyString")
    @lesson.stub!(:discipline_id).and_return("1")
    assigns[:lesson] = @lesson

    template.should_receive(:object_url).twice.and_return(lesson_path(@lesson)) 
    template.should_receive(:collection_url).and_return(lessons_path) 
  end

#  it "should render edit form" do
#    render "/lessons/edit.html.erb"
#    
#    response.should have_tag("form[action=#{lesson_path(@lesson)}][method=post]") do
#      with_tag('input#lesson_name[name=?]', "lesson[name]")
#    end
#  end
end


