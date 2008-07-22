require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/classes/new.html.erb" do
  include ClassesHelper
  
  before(:each) do
    @classe = mock_model(Classe)
    @classe.stub!(:new_record?).and_return(true)
    assigns[:classe] = @classe


    template.stub!(:object_url).and_return(classe_path(@classe)) 
    template.stub!(:collection_url).and_return(classes_path) 
  end

#  it "should render new form" do
#    render "/classes/new.html.erb"
#    
#    response.should have_tag("form[action=?][method=post]", classes_path) do
#    end
#  end
end


