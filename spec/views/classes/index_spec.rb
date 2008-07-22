require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/classes/index.html.erb" do
  include ClassesHelper
  
  before(:each) do
    classe_98 = mock_model(Classe)
    classe_99 = mock_model(Classe)

    assigns[:classes] = [classe_98, classe_99]

    template.stub!(:object_url).and_return(classe_path(@classe)) 
    template.stub!(:new_object_url).and_return(new_classe_path) 
    template.stub!(:edit_object_url).and_return(edit_classe_path(@classe)) 
  end

#  it "should render list of classes" do
#    render "/classes/index.html.erb"
#  end
end

