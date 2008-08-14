require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe DisciplinesController do
  should_have_ajaxian_responses_enabled
  
  describe "handling GET /disciplines" do

    before(:each) do
      @discipline = mock_model(Discipline)
      Discipline.stub!(:find).and_return([@discipline])
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
  
    it "should find all disciplines" do
      Discipline.should_receive(:find).with(:all).and_return([@discipline])
      do_get
    end
  
    it "should assign the found disciplines for the view" do
      do_get
      assigns[:disciplines].should == [@discipline]
    end
  end

  describe "handling GET /disciplines/1" do

    before(:each) do
      @discipline = mock_model(Discipline)
      Discipline.stub!(:find).and_return(@discipline)
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
  
    it "should find the discipline requested" do
      Discipline.should_receive(:find).with("1").and_return(@discipline)
      do_get
    end
  
    it "should assign the found discipline for the view" do
      do_get
      assigns[:discipline].should equal(@discipline)
    end
  end

  describe "handling GET /disciplines/new" do

    before(:each) do
      @discipline = mock_model(Discipline)
      Discipline.stub!(:new).and_return(@discipline)
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
  
    it "should create an new discipline" do
      Discipline.should_receive(:new).and_return(@discipline)
      do_get
    end
  
    it "should not save the new discipline" do
      @discipline.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new discipline for the view" do
      do_get
      assigns[:discipline].should equal(@discipline)
    end
  end

  describe "handling GET /disciplines/1/edit" do

    before(:each) do
      @discipline = mock_model(Discipline)
      Discipline.stub!(:find).and_return(@discipline)
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
  
    it "should find the discipline requested" do
      Discipline.should_receive(:find).and_return(@discipline)
      do_get
    end
  
    it "should assign the found Disciplines for the view" do
      do_get
      assigns[:discipline].should equal(@discipline)
    end
  end

  describe "handling POST /disciplines" do

    before(:each) do
      @discipline = mock_model(Discipline, :to_param => "1")
      Discipline.stub!(:new).and_return(@discipline)
    end
    
    describe "with successful save" do
  
      def do_post
        @discipline.should_receive(:save).and_return(true)
        post :create, :discipline => {}
      end
  
      it "should create a new discipline" do
        Discipline.should_receive(:new).with({}).and_return(@discipline)
        do_post
      end

      it "should redirect to the new discipline" do
        do_post
        response.should redirect_to(discipline_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @discipline.should_receive(:save).and_return(false)
        post :create, :discipline => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /disciplines/1" do

    before(:each) do
      @discipline = mock_model(Discipline, :to_param => "1")
      Discipline.stub!(:find).and_return(@discipline)
    end
    
    describe "with successful update" do

      def do_put
        @discipline.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the discipline requested" do
        Discipline.should_receive(:find).with("1").and_return(@discipline)
        do_put
      end

      it "should update the found discipline" do
        do_put
        assigns(:discipline).should equal(@discipline)
      end

      it "should assign the found discipline for the view" do
        do_put
        assigns(:discipline).should equal(@discipline)
      end

      it "should redirect to the discipline" do
        do_put
        response.should redirect_to(discipline_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @discipline.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /disciplines/1" do

    before(:each) do
      @discipline = mock_model(Discipline, :destroy => true)
      Discipline.stub!(:find).and_return(@discipline)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the discipline requested" do
      Discipline.should_receive(:find).with("1").and_return(@discipline)
      do_delete
    end
  
    it "should call destroy on the found discipline" do
      @discipline.should_receive(:destroy).and_return(true) 
      do_delete
    end
  
    it "should redirect to the disciplines list" do
      do_delete
      response.should redirect_to(disciplines_url)
    end
  end
end
