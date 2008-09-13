require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StudentsHelper do
  describe ".title" do
    it "should return title" do
      string = "Students"
      helper.should_receive(:_).with(string).and_return(string)
      helper.title.should eql(string)
    end
  end
  
  describe ".css_class_to_contract_installments" do
    it "should return formated css class to installments" do
      contract = contracts(:johnny_cash_one)
      helper.css_class_to_contract_installments(contract).should == 'contract-784324265-installments'
    end
  end
  
  describe ".css_to_contract_installments" do
    it "should return css class and display none to installments" do
      contract = contracts(:johnny_cash_one)
      helper.css_to_contract_installments(contract).should == 'class="contract-784324265-installments" style="display: none;"'
    end
  end
end
