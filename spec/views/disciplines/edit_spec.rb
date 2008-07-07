require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/disciplines/edit.html.erb" do
  include DisciplinesHelper
  
  before do
    @discipline = mock_model(Discipline)
    @discipline.stub!(:name).and_return("MyString")
    @discipline.stub!(:teacher_id).and_return("1")
    assigns[:discipline] = @discipline

    template.should_receive(:object_url).twice.and_return(discipline_path(@discipline)) 
    template.should_receive(:collection_url).and_return(disciplines_path) 
  end

#  it "should render edit form" do
#    render "/disciplines/edit.html.erb"
#    
#    response.should have_tag("form[action=#{discipline_path(@discipline)}][method=post]") do
#      with_tag('input#discipline_name[name=?]', "discipline[name]")
#    end
#  end
end


