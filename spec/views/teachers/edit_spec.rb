require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/teachers/edit.html.erb" do
  include TeachersHelper
  
  before do
    @teacher = mock_model(Teacher)
    @teacher.stub!(:name).and_return("MyString")
    assigns[:teacher] = @teacher

    template.should_receive(:object_url).twice.and_return(teacher_path(@teacher)) 
    template.should_receive(:collection_url).and_return(teachers_path) 
  end

#  it "should render edit form" do
#    render "/teachers/edit.html.erb"
#    
#    response.should have_tag("form[action=#{teacher_path(@teacher)}][method=post]") do
#      with_tag('input#teacher_name[name=?]', "teacher[name]")
#    end
#  end
end


