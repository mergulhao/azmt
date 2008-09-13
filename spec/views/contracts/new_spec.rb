require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contracts/new.html.erb" do
  include ContractsHelper
  
  before(:each) do
    @contract = mock_model(Contract)
    @contract.stub!(:new_record?).and_return(true)
    @contract.stub!(:registration_value).and_return("1")
    @contract.stub!(:financing_tranche).and_return("1")
    @contract.stub!(:financing_tranche_number).and_return("1")
    assigns[:contract] = @contract


    template.stub!(:object_url).and_return(contract_path(@contract)) 
    template.stub!(:collection_url).and_return(contracts_path) 
  end

#  it "should render new form" do
#    render "/contracts/new.html.erb"
#    
#    response.should have_tag("form[action=?][method=post]", contracts_path) do
#      with_tag("input#contract_registration_value[name=?]", "contract[registration_value]")
#      with_tag("input#contract_financing_tranche[name=?]", "contract[financing_tranche]")
#      with_tag("input#contract_financing_tranche_number[name=?]", "contract[financing_tranche_number]")
#    end
#  end
end


