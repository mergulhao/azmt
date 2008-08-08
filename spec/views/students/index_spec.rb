require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/students/index.html.erb" do
  include StudentsHelper
  
  before(:each) do
    student_98 = mock_model(Student)
    student_98.should_receive(:name).and_return("MyString")
    student_98.should_receive(:street).and_return("MyString")
    student_98.should_receive(:number).and_return("MyString")
    student_98.should_receive(:complement).and_return("MyString")
    student_98.should_receive(:neiborhood).and_return("MyString")
    student_98.should_receive(:zip).and_return("MyString")
    student_98.should_receive(:home_phone).and_return("MyString")
    student_98.should_receive(:comercial_phone).and_return("MyString")
    student_98.should_receive(:mobile_phone).and_return("MyString")
    student_98.should_receive(:cpf).and_return("MyString")
    student_99 = mock_model(Student)
    student_99.should_receive(:name).and_return("MyString")
    student_99.should_receive(:street).and_return("MyString")
    student_99.should_receive(:number).and_return("MyString")
    student_99.should_receive(:complement).and_return("MyString")
    student_99.should_receive(:neiborhood).and_return("MyString")
    student_99.should_receive(:zip).and_return("MyString")
    student_99.should_receive(:home_phone).and_return("MyString")
    student_99.should_receive(:comercial_phone).and_return("MyString")
    student_99.should_receive(:mobile_phone).and_return("MyString")
    student_99.should_receive(:cpf).and_return("MyString")

    assigns[:students] = [student_98, student_99]

    template.stub!(:object_url).and_return(student_path(@student)) 
    template.stub!(:new_object_url).and_return(new_student_path) 
    template.stub!(:edit_object_url).and_return(edit_student_path(@student)) 
  end

#  it "should render list of students" do
#    render "/students/index.html.erb"
#    response.should have_tag("tr>td", "MyString", 2)
#    response.should have_tag("tr>td", "MyString", 2)
#    response.should have_tag("tr>td", "MyString", 2)
#    response.should have_tag("tr>td", "MyString", 2)
#    response.should have_tag("tr>td", "MyString", 2)
#    response.should have_tag("tr>td", "MyString", 2)
#    response.should have_tag("tr>td", "MyString", 2)
#    response.should have_tag("tr>td", "MyString", 2)
#    response.should have_tag("tr>td", "MyString", 2)
#    response.should have_tag("tr>td", "MyString", 2)
#  end
end

