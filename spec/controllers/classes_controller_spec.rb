require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClassesController do
  describe "handling GET /classes" do

    before(:each) do
      @classe = mock_model(Classe)
      Classe.stub!(:find).and_return([@classe])
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
  
    it "should find all classes" do
      Classe.should_receive(:find).with(:all).and_return([@classe])
      do_get
    end
  
    it "should assign the found classes for the view" do
      do_get
      assigns[:classes].should == [@classe]
    end
  end

  describe "handling GET /classes/1" do

    before(:each) do
      @classe = mock_model(Classe)
      Classe.stub!(:find).and_return(@classe)
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
  
    it "should find the classe requested" do
      Classe.should_receive(:find).with("1").and_return(@classe)
      do_get
    end
  
    it "should assign the found classe for the view" do
      do_get
      assigns[:classe].should equal(@classe)
    end
  end

  describe "handling GET /classes/new" do

    before(:each) do
      @classe = mock_model(Classe)
      Classe.stub!(:new).and_return(@classe)
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
  
    it "should create an new classe" do
      Classe.should_receive(:new).and_return(@classe)
      do_get
    end
  
    it "should not save the new classe" do
      @classe.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new classe for the view" do
      do_get
      assigns[:classe].should equal(@classe)
    end
  end

  describe "handling GET /classes/1/edit" do

    before(:each) do
      @classe = mock_model(Classe)
      Classe.stub!(:find).and_return(@classe)
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
  
    it "should find the classe requested" do
      Classe.should_receive(:find).and_return(@classe)
      do_get
    end
  
    it "should assign the found Classes for the view" do
      do_get
      assigns[:classe].should equal(@classe)
    end
  end

  describe "handling POST /classes" do

    before(:each) do
      @classe = mock_model(Classe, :to_param => "1")
      Classe.stub!(:new).and_return(@classe)
    end
    
    describe "with successful save" do
  
      def do_post
        @classe.should_receive(:save).and_return(true)
        post :create, :classe => {}
      end
  
      it "should create a new classe" do
        Classe.should_receive(:new).with({}).and_return(@classe)
        do_post
      end

      it "should redirect to the new classe" do
        do_post
        response.should redirect_to(classe_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @classe.should_receive(:save).and_return(false)
        post :create, :classe => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /classes/1" do

    before(:each) do
      @classe = mock_model(Classe, :to_param => "1")
      Classe.stub!(:find).and_return(@classe)
    end
    
    describe "with successful update" do

      def do_put
        @classe.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the classe requested" do
        Classe.should_receive(:find).with("1").and_return(@classe)
        do_put
      end

      it "should update the found classe" do
        do_put
        assigns(:classe).should equal(@classe)
      end

      it "should assign the found classe for the view" do
        do_put
        assigns(:classe).should equal(@classe)
      end

      it "should redirect to the classe" do
        do_put
        response.should redirect_to(classe_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @classe.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /classes/1" do

    before(:each) do
      @classe = mock_model(Classe, :destroy => true)
      Classe.stub!(:find).and_return(@classe)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the classe requested" do
      Classe.should_receive(:find).with("1").and_return(@classe)
      do_delete
    end
  
    it "should call destroy on the found classe" do
      @classe.should_receive(:destroy).and_return(true) 
      do_delete
    end
  
    it "should redirect to the classes list" do
      do_delete
      response.should redirect_to(classes_url)
    end
  end
end
