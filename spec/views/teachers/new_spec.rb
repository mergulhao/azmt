require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/teachers/new.html.erb" do
  include TeachersHelper
  
  before(:each) do
    @teacher = mock_model(Teacher)
    @teacher.stub!(:new_record?).and_return(true)
    @teacher.stub!(:name).and_return("MyString")
    assigns[:teacher] = @teacher


    template.stub!(:object_url).and_return(teacher_path(@teacher)) 
    template.stub!(:collection_url).and_return(teachers_path) 
  end

  it "should render new form" do
    render "/teachers/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", teachers_path) do
      with_tag("input#teacher_name[name=?]", "teacher[name]")
    end
  end
end


