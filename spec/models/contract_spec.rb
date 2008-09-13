require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Contract do
  before(:each) do
    @contract = Contract.new
  end

  it "should return contract number formated" do
    contract = contracts(:johnny_cash_one)
    contract.number.should == "784324265"
    contract.should_receive(:id).and_return(2)
    contract.number.should == "00002"
  end
  
  it "should return installments ordered by due_date ASC" do
    contract = contracts(:johnny_cash_one)
    contract.installments.should == installments(:first, :second)
  end
  
  it "should be valid" do
    @contract.should be_valid
  end
end
