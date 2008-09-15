require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Installment do
  before(:each) do
    @installment = installments(:second)
  end

  it "should be valid" do
    @installment.should be_valid
  end
  
  it "should update date" do
    @installment.due_date.should == Date.today.end_of_week + 1.month
    @installment.due_date = Date.today
    @installment.save!
    @installment.reload
    @installment.due_date.should == Date.today
  end
end
