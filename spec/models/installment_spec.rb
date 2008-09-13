require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Installment do
  before(:each) do
    @installment = Installment.new
  end

  it "should be valid" do
    @installment.should be_valid
  end
end
