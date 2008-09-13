require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Contract do
  before(:each) do
    @contract = Contract.new
  end

  it "should be valid" do
    @contract.should be_valid
  end
end
