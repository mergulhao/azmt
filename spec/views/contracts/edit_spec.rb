require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/contracts/edit.html.erb" do
  include ContractsHelper
  
  before do
    @contract = mock_model(Contract)
    @contract.stub!(:registration_value).and_return("1")
    @contract.stub!(:financing_tranche).and_return("1")
    @contract.stub!(:financing_tranche_number).and_return("1")
    assigns[:contract] = @contract

    template.should_receive(:object_url).twice.and_return(contract_path(@contract)) 
    template.should_receive(:collection_url).and_return(contracts_path) 
  end

#  it "should render edit form" do
#    render "/contracts/edit.html.erb"
#    
#    response.should have_tag("form[action=#{contract_path(@contract)}][method=post]") do
#      with_tag('input#contract_registration_value[name=?]', "contract[registration_value]")
#      with_tag('input#contract_financing_tranche[name=?]', "contract[financing_tranche]")
#      with_tag('input#contract_financing_tranche_number[name=?]', "contract[financing_tranche_number]")
#    end
#  end
end


