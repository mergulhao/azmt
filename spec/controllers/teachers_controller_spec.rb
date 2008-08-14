require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TeachersController do
  should_have_ajaxian_responses_enabled
  
  describe "handling GET /teachers" do

    before(:each) do
      @teacher = mock_model(Teacher)
      Teacher.stub!(:find).and_return([@teacher])
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
  
    it "should find all teachers" do
      Teacher.should_receive(:find).with(:all).and_return([@teacher])
      do_get
    end
  
    it "should assign the found teachers for the view" do
      do_get
      assigns[:teachers].should == [@teacher]
    end
  end

  describe "handling GET /teachers/1" do

    before(:each) do
      @teacher = mock_model(Teacher)
      Teacher.stub!(:find).and_return(@teacher)
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
  
    it "should find the teacher requested" do
      Teacher.should_receive(:find).with("1").and_return(@teacher)
      do_get
    end
  
    it "should assign the found teacher for the view" do
      do_get
      assigns[:teacher].should equal(@teacher)
    end
  end

  describe "handling GET /teachers/new" do

    before(:each) do
      @teacher = mock_model(Teacher)
      Teacher.stub!(:new).and_return(@teacher)
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
  
    it "should create an new teacher" do
      Teacher.should_receive(:new).and_return(@teacher)
      do_get
    end
  
    it "should not save the new teacher" do
      @teacher.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new teacher for the view" do
      do_get
      assigns[:teacher].should equal(@teacher)
    end
  end

  describe "handling GET /teachers/1/edit" do

    before(:each) do
      @teacher = mock_model(Teacher)
      Teacher.stub!(:find).and_return(@teacher)
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
  
    it "should find the teacher requested" do
      Teacher.should_receive(:find).and_return(@teacher)
      do_get
    end
  
    it "should assign the found Teachers for the view" do
      do_get
      assigns[:teacher].should equal(@teacher)
    end
  end

  describe "handling POST /teachers" do

    before(:each) do
      @teacher = mock_model(Teacher, :to_param => "1")
      Teacher.stub!(:new).and_return(@teacher)
    end
    
    describe "with successful save" do
  
      def do_post
        @teacher.should_receive(:save).and_return(true)
        post :create, :teacher => {}
      end
  
      it "should create a new teacher" do
        Teacher.should_receive(:new).with({}).and_return(@teacher)
        do_post
      end

      it "should redirect to the new teacher" do
        do_post
        response.should redirect_to(teacher_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @teacher.should_receive(:save).and_return(false)
        post :create, :teacher => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /teachers/1" do

    before(:each) do
      @teacher = mock_model(Teacher, :to_param => "1")
      Teacher.stub!(:find).and_return(@teacher)
    end
    
    describe "with successful update" do

      def do_put
        @teacher.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the teacher requested" do
        Teacher.should_receive(:find).with("1").and_return(@teacher)
        do_put
      end

      it "should update the found teacher" do
        do_put
        assigns(:teacher).should equal(@teacher)
      end

      it "should assign the found teacher for the view" do
        do_put
        assigns(:teacher).should equal(@teacher)
      end

      it "should redirect to the teacher" do
        do_put
        response.should redirect_to(teacher_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @teacher.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /teachers/1" do

    before(:each) do
      @teacher = mock_model(Teacher, :destroy => true)
      Teacher.stub!(:find).and_return(@teacher)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the teacher requested" do
      Teacher.should_receive(:find).with("1").and_return(@teacher)
      do_delete
    end
  
    it "should call destroy on the found teacher" do
      @teacher.should_receive(:destroy).and_return(true) 
      do_delete
    end
  
    it "should redirect to the teachers list" do
      do_delete
      response.should redirect_to(teachers_url)
    end
  end
end
