require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contracts/show.html.erb" do
  include ContractsHelper
  
  before(:each) do
    @contract = mock_model(Contract)
    @contract.stub!(:registration_value).and_return("1")
    @contract.stub!(:financing_tranche).and_return("1")
    @contract.stub!(:financing_tranche_number).and_return("1")

    assigns[:contract] = @contract

    template.stub!(:edit_object_url).and_return(edit_contract_path(@contract)) 
    template.stub!(:collection_url).and_return(contracts_path) 
  end

#  it "should render attributes in <p>" do
#    render "/contracts/show.html.erb"
#    response.should have_text(/1/)
#    response.should have_text(/1/)
#    response.should have_text(/1/)
#  end
end

