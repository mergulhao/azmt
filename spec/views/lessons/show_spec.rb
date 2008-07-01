require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lessons/show.html.erb" do
  include LessonsHelper
  
  before(:each) do
    @lesson = mock_model(Lesson)
    @lesson.stub!(:name).and_return("MyString")
    @lesson.stub!(:discipline).and_return("Discipline 1")

    assigns[:lesson] = @lesson

    template.stub!(:edit_object_url).and_return(edit_lesson_path(@lesson)) 
    template.stub!(:collection_url).and_return(lessons_path) 
  end

  it "should render attributes in <p>" do
    render "/lessons/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/Discipline 1/)
  end
end

