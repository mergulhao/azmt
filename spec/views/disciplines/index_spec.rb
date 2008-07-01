require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/disciplines/index.html.erb" do
  include DisciplinesHelper
  
  before(:each) do
    discipline_98 = mock_model(Discipline)
    discipline_98.should_receive(:name).and_return("MyString")
    discipline_98.should_receive(:teacher_id).and_return("1")
    discipline_99 = mock_model(Discipline)
    discipline_99.should_receive(:name).and_return("MyString")
    discipline_99.should_receive(:teacher_id).and_return("1")

    assigns[:disciplines] = [discipline_98, discipline_99]

    template.stub!(:object_url).and_return(discipline_path(@discipline)) 
    template.stub!(:new_object_url).and_return(new_discipline_path) 
    template.stub!(:edit_object_url).and_return(edit_discipline_path(@discipline)) 
  end

  it "should render list of disciplines" do
    render "/disciplines/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

