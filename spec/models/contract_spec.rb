require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Contract do
  before(:each) do
    @contract = contracts(:johnny_cash_one)
  end

  it "should return contract number formated" do
    @contract.number.should == "784324265"
    @contract.should_receive(:id).and_return(2)
    @contract.number.should == "00002"
  end
  
  it "should return installments ordered by due_date ASC" do
    @contract.installments.should == installments(:first, :second)
  end
  
  it "should be valid" do
    @contract.should be_valid
  end
  
  describe "handling multiple models" do
    it "should handle new_installment_attributes=" do
      @contract.installments.count.should == 2
      @contract.new_installment_attributes = [
          {
            :due_date => '24/05/2008',
            :bank_number => '123',
            :bank_branch => '456',
            :bank_account => '789',
            :bank_check => '159',
            :value => 1569.63
          }
      ]
      @contract.save!
      @contract.installments.count.should == 3
    end
    
    it "should handle existing_installments_attributes=" do
      @contract.installments.count.should == 2
      installment = installments(:second)
      
      @contract.existing_installments_attributes = {
          "#{installment.id}" => {
            :due_date => '24/05/2008',
            :bank_number => '753',
            :bank_branch => '357',
            :bank_account => '951',
            :bank_check => '593',
            :value => 1569.63
          }
      }
      @contract.save!
      @contract.installments.count.should == 1
      
      installment.reload
      installment.bank_number.should == '753'
      installment.bank_branch.should == '357'
      installment.bank_account.should == '951'
      installment.bank_check.should == '593'
      installment.value.should == 1569.63
      installment.due_date.should == Date.new(2008,05,24)
    end
  end
end
