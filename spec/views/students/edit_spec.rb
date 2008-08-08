require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/students/edit.html.erb" do
  include StudentsHelper
  
  before do
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

    template.should_receive(:object_url).twice.and_return(student_path(@student)) 
    template.should_receive(:collection_url).and_return(students_path) 
  end

#  it "should render edit form" do
#    render "/students/edit.html.erb"
#    
#    response.should have_tag("form[action=#{student_path(@student)}][method=post]") do
#      with_tag('input#student_name[name=?]', "student[name]")
#      with_tag('input#student_street[name=?]', "student[street]")
#      with_tag('input#student_number[name=?]', "student[number]")
#      with_tag('input#student_complement[name=?]', "student[complement]")
#      with_tag('input#student_neiborhood[name=?]', "student[neiborhood]")
#      with_tag('input#student_zip[name=?]', "student[zip]")
#      with_tag('input#student_home_phone[name=?]', "student[home_phone]")
#      with_tag('input#student_comercial_phone[name=?]', "student[comercial_phone]")
#      with_tag('input#student_mobile_phone[name=?]', "student[mobile_phone]")
#      with_tag('input#student_cpf[name=?]', "student[cpf]")
#    end
#  end
end


