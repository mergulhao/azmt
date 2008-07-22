require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/classes/show.html.erb" do
  include ClassesHelper
  
  before(:each) do
    @classe = mock_model(Classe)

    assigns[:classe] = @classe

    template.stub!(:edit_object_url).and_return(edit_classe_path(@classe)) 
    template.stub!(:collection_url).and_return(classes_path) 
  end

  it "should render attributes in <p>" do
    render "/classes/show.html.erb"
  end
end

