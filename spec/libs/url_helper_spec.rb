require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ActionView::Helpers::UrlHelper do
  include ActionView::Helpers::UrlHelper

  it "should call convert_options_to_javascript_without_model_box if no confirm" do
    self.should_receive(:convert_options_to_javascript_without_model_box!).with({:my_options => 'hi!'}, '/my/url')
    convert_options_to_javascript!({:my_options => 'hi!'}, '/my/url')
  end
  
  it "should render modalbox confirmation" do
    self.should_receive(:button_to).with("Continuar", "/my/url", {"method"=>:delete}).and_return("button_to")
    self.should_receive(:button_to_function).with("Cancelar", "Modalbox.hide()").and_return("button_to_function")
    self.should_receive(:escape_javascript).with("My confirmation")
    
    html_options = {'confirm' => 'My confirmation', 'method' => :delete}
    convert_options_to_javascript!(html_options, '/my/url')
    
    html_options["onclick"].should eql("Modalbox.show('<div>button_to&nbsp;&nbsp;&nbsp;button_to_function</div>', {title: 'Confirmation: ', width: 250}); return false;")
    html_options["confirm"].should be_nil
    html_options["method"].should be_nil
  end
end
