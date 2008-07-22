require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/classes/edit.html.erb" do
  include ClassesHelper
  
  before do
    @classe = mock_model(Classe)
    assigns[:classe] = @classe

    template.should_receive(:object_url).twice.and_return(classe_path(@classe)) 
    template.should_receive(:collection_url).and_return(classes_path) 
  end

#  it "should render edit form" do
#    render "/classes/edit.html.erb"
#    
#    response.should have_tag("form[action=#{classe_path(@classe)}][method=post]") do
#    end
#  end
end


