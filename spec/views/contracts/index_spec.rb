require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contracts/index.html.erb" do
  include ContractsHelper
  
  before(:each) do
    contract_98 = mock_model(Contract)
    contract_98.should_receive(:registration_value).and_return("1")
    contract_98.should_receive(:financing_tranche).and_return("1")
    contract_98.should_receive(:financing_tranche_number).and_return("1")
    contract_99 = mock_model(Contract)
    contract_99.should_receive(:registration_value).and_return("1")
    contract_99.should_receive(:financing_tranche).and_return("1")
    contract_99.should_receive(:financing_tranche_number).and_return("1")

    assigns[:contracts] = [contract_98, contract_99]

    template.stub!(:object_url).and_return(contract_path(@contract)) 
    template.stub!(:new_object_url).and_return(new_contract_path) 
    template.stub!(:edit_object_url).and_return(edit_contract_path(@contract)) 
  end

  it "should render list of contracts" do
    render "/contracts/index.html.erb"
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
    response.should have_tag("tr>td", "1", 2)
  end
end

