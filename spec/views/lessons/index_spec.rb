require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/lessons/index.html.erb" do
  include LessonsHelper
  
  before(:each) do
    lesson_98 = mock_model(Lesson)
    lesson_98.should_receive(:name).and_return("MyString")
    lesson_98.should_receive(:discipline_id).and_return("1")
    lesson_99 = mock_model(Lesson)
    lesson_99.should_receive(:name).and_return("MyString")
    lesson_99.should_receive(:discipline_id).and_return("1")

    assigns[:lessons] = [lesson_98, lesson_99]

    template.stub!(:object_url).and_return(lesson_path(@lesson)) 
    template.stub!(:new_object_url).and_return(new_lesson_path) 
    template.stub!(:edit_object_url).and_return(edit_lesson_path(@lesson)) 
  end

  it "should render list of lessons" do
    render "/lessons/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

