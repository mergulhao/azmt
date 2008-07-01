require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/disciplines/new.html.erb" do
  include DisciplinesHelper
  
  before(:each) do
    @discipline = mock_model(Discipline)
    @discipline.stub!(:new_record?).and_return(true)
    @discipline.stub!(:name).and_return("MyString")
    @discipline.stub!(:teacher_id).and_return("1")
    assigns[:discipline] = @discipline


    template.stub!(:object_url).and_return(discipline_path(@discipline)) 
    template.stub!(:collection_url).and_return(disciplines_path) 
  end

  it "should render new form" do
    render "/disciplines/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", disciplines_path) do
      with_tag("input#discipline_name[name=?]", "discipline[name]")
    end
  end
end


