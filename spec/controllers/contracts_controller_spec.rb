require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ContractsController do
  describe "handling GET /contracts" do

    before(:each) do
      @contract = mock_model(Contract)
      Contract.stub!(:find).and_return([@contract])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all contracts" do
      Contract.should_receive(:find).with(:all).and_return([@contract])
      do_get
    end
  
    it "should assign the found contracts for the view" do
      do_get
      assigns[:contracts].should == [@contract]
    end
  end

  describe "handling GET /contracts/1" do

    before(:each) do
      @contract = mock_model(Contract)
      Contract.stub!(:find).and_return(@contract)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the contract requested" do
      Contract.should_receive(:find).with("1").and_return(@contract)
      do_get
    end
  
    it "should assign the found contract for the view" do
      do_get
      assigns[:contract].should equal(@contract)
    end
  end

  describe "handling GET /contracts/new" do

    before(:each) do
      @contract = mock_model(Contract)
      Contract.stub!(:new).and_return(@contract)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new contract" do
      Contract.should_receive(:new).and_return(@contract)
      do_get
    end
  
    it "should not save the new contract" do
      @contract.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new contract for the view" do
      do_get
      assigns[:contract].should equal(@contract)
    end
  end

  describe "handling GET /contracts/1/edit" do

    before(:each) do
      @contract = mock_model(Contract)
      Contract.stub!(:find).and_return(@contract)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the contract requested" do
      Contract.should_receive(:find).and_return(@contract)
      do_get
    end
  
    it "should assign the found Contracts for the view" do
      do_get
      assigns[:contract].should equal(@contract)
    end
  end

  describe "handling POST /contracts" do

    before(:each) do
      @contract = mock_model(Contract, :to_param => "1")
      Contract.stub!(:new).and_return(@contract)
    end
    
    describe "with successful save" do
  
      def do_post
        @contract.should_receive(:save).and_return(true)
        post :create, :contract => {}
      end
  
      it "should create a new contract" do
        Contract.should_receive(:new).with({}).and_return(@contract)
        do_post
      end

      it "should redirect to the new contract" do
        do_post
        response.should redirect_to(contract_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @contract.should_receive(:save).and_return(false)
        post :create, :contract => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /contracts/1" do

    before(:each) do
      @contract = mock_model(Contract, :to_param => "1")
      Contract.stub!(:find).and_return(@contract)
    end
    
    describe "with successful update" do

      def do_put
        @contract.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the contract requested" do
        Contract.should_receive(:find).with("1").and_return(@contract)
        do_put
      end

      it "should update the found contract" do
        do_put
        assigns(:contract).should equal(@contract)
      end

      it "should assign the found contract for the view" do
        do_put
        assigns(:contract).should equal(@contract)
      end

      it "should redirect to the contract" do
        do_put
        response.should redirect_to(contract_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @contract.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /contracts/1" do

    before(:each) do
      @contract = mock_model(Contract, :destroy => true)
      Contract.stub!(:find).and_return(@contract)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the contract requested" do
      Contract.should_receive(:find).with("1").and_return(@contract)
      do_delete
    end
  
    it "should call destroy on the found contract" do
      @contract.should_receive(:destroy).and_return(true) 
      do_delete
    end
  
    it "should redirect to the contracts list" do
      do_delete
      response.should redirect_to(contracts_url)
    end
  end
end