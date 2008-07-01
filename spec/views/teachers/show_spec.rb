require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/teachers/show.html.erb" do
  include TeachersHelper
  
  before(:each) do
    @teacher = mock_model(Teacher)
    @teacher.stub!(:name).and_return("MyString")

    assigns[:teacher] = @teacher

    template.stub!(:edit_object_url).and_return(edit_teacher_path(@teacher)) 
    template.stub!(:collection_url).and_return(teachers_path) 
  end

  it "should render attributes in <p>" do
    render "/teachers/show.html.erb"
    response.should have_text(/MyString/)
  end
end

