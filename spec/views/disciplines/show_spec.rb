require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/disciplines/show.html.erb" do
  include DisciplinesHelper
  
  before(:each) do
    @discipline = mock_model(Discipline)
    @discipline.stub!(:name).and_return("MyString")
    @discipline.stub!(:teacher).and_return("A Teacher")

    assigns[:discipline] = @discipline

    template.stub!(:edit_object_url).and_return(edit_discipline_path(@discipline)) 
    template.stub!(:collection_url).and_return(disciplines_path) 
  end

  it "should render attributes in <p>" do
    render "/disciplines/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/A Teacher/)
  end
end

