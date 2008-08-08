require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/students/show.html.erb" do
  include StudentsHelper
  
  before(:each) do
    @student = mock_model(Student)
    @student.stub!(:name).and_return("MyString")
    @student.stub!(:street).and_return("MyString")
    @student.stub!(:number).and_return("MyString")
    @student.stub!(:complement).and_return("MyString")
    @student.stub!(:neiborhood).and_return("MyString")
    @student.stub!(:zip).and_return("MyString")
    @student.stub!(:home_phone).and_return("MyString")
    @student.stub!(:comercial_phone).and_return("MyString")
    @student.stub!(:mobile_phone).and_return("MyString")
    @student.stub!(:cpf).and_return("MyString")

    assigns[:student] = @student

    template.stub!(:edit_object_url).and_return(edit_student_path(@student)) 
    template.stub!(:collection_url).and_return(students_path) 
  end

#  it "should render attributes in <p>" do
#    render "/students/show.html.erb"
#    response.should have_text(/MyString/)
#    response.should have_text(/MyString/)
#    response.should have_text(/MyString/)
#    response.should have_text(/MyString/)
#    response.should have_text(/MyString/)
#    response.should have_text(/MyString/)
#    response.should have_text(/MyString/)
#    response.should have_text(/MyString/)
#    response.should have_text(/MyString/)
#    response.should have_text(/MyString/)
#  end
end

