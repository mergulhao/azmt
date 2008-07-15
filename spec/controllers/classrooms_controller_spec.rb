require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClassroomsController do
  describe "handling GET /classrooms" do

    before(:each) do
      @classroom = mock_model(Classroom)
      Classroom.stub!(:find).and_return([@classroom])
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
  
    it "should find all classrooms" do
      Classroom.should_receive(:find).with(:all).and_return([@classroom])
      do_get
    end
  
    it "should assign the found classrooms for the view" do
      do_get
      assigns[:classrooms].should == [@classroom]
    end
  end

  describe "handling GET /classrooms/1" do

    before(:each) do
      @classroom = mock_model(Classroom)
      Classroom.stub!(:find).and_return(@classroom)
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
  
    it "should find the classroom requested" do
      Classroom.should_receive(:find).with("1").and_return(@classroom)
      do_get
    end
  
    it "should assign the found classroom for the view" do
      do_get
      assigns[:classroom].should equal(@classroom)
    end
  end

  describe "handling GET /classrooms/new" do

    before(:each) do
      @classroom = mock_model(Classroom)
      Classroom.stub!(:new).and_return(@classroom)
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
  
    it "should create an new classroom" do
      Classroom.should_receive(:new).and_return(@classroom)
      do_get
    end
  
    it "should not save the new classroom" do
      @classroom.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new classroom for the view" do
      do_get
      assigns[:classroom].should equal(@classroom)
    end
  end
  
  describe "handling XHR GET /classrooms/new" do

    before(:each) do
      @classroom = mock_model(Classroom)
      Classroom.stub!(:new).and_return(@classroom)
    end
  
    def do_xhr
      xhr :get, :new
    end

    it "should be successful" do
      do_xhr
      response.should be_success
    end
  
    it "should render new template" do
      do_xhr
      response.should render_template('new')
    end
    
    it "should not render layout" do
      controller.expect_render(:layout => false)
      do_xhr
    end
  
    it "should create an new classroom" do
      Classroom.should_receive(:new).and_return(@classroom)
      do_xhr
    end

    it "should not save the new classroom" do
      @classroom.should_not_receive(:save)
      do_xhr
    end
  
    it "should assign the new classroom for the view" do
      do_xhr
      assigns[:classroom].should equal(@classroom)
    end
  end

  describe "handling GET /classrooms/1/edit" do

    before(:each) do
      @classroom = mock_model(Classroom)
      Classroom.stub!(:find).and_return(@classroom)
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
  
    it "should find the classroom requested" do
      Classroom.should_receive(:find).and_return(@classroom)
      do_get
    end
  
    it "should assign the found Classrooms for the view" do
      do_get
      assigns[:classroom].should equal(@classroom)
    end
  end
  
  describe "handling XHR GET /classrooms/1/edit" do

    before(:each) do
      @classroom = mock_model(Classroom)
      Classroom.stub!(:find).and_return(@classroom)
    end
  
    def do_xhr
      xhr :get, :edit, :id => "1"
    end

    it "should be successful" do
      do_xhr
      response.should be_success
    end
  
    it "should render edit template" do
      do_xhr
      response.should render_template('edit')
    end
    
    it "should not render layout" do
      controller.expect_render(:layout => false)
      do_xhr
    end
  
    it "should find the classroom requested" do
      Classroom.should_receive(:find).and_return(@classroom)
      do_xhr
    end
  
    it "should assign the found Classrooms for the view" do
      do_xhr
      assigns[:classroom].should equal(@classroom)
    end
  end

  describe "handling POST /classrooms" do

    before(:each) do
      @classroom = mock_model(Classroom, :to_param => "1")
      Classroom.stub!(:new).and_return(@classroom)
    end
    
    describe "with successful save" do
  
      def do_post
        @classroom.should_receive(:save).and_return(true)
        post :create, :classroom => {}
      end
  
      it "should create a new classroom" do
        Classroom.should_receive(:new).with({}).and_return(@classroom)
        do_post
      end

      it "should redirect to the new classroom" do
        do_post
        response.should redirect_to(classroom_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @classroom.should_receive(:save).and_return(false)
        post :create, :classroom => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end
  
  describe "handling XHR POST /classrooms" do

    before(:each) do
      @classroom = mock_model(Classroom, :to_param => "1")
      Classroom.stub!(:new).and_return(@classroom)
    end
    
    describe "with successful save" do
  
      def do_xhr
        @classroom.should_receive(:save).and_return(true)
        xhr :post, :create, :classroom => {}
      end
  
      it "should create a new classroom" do
        Classroom.should_receive(:new).with({}).and_return(@classroom)
        do_xhr
      end

      it "should render redirect_to_collection" do
        do_xhr
        response.should render_template('common/redirect_to_collection')
      end

    end
    
    describe "with failed save" do

      def do_xhr
        @classroom.should_receive(:save).and_return(false)
        xhr :post, :create, :classroom => {}
      end
  
      it "should re-render 'new'" do
        do_xhr
        response.should render_template('new')
      end
      
      it "should not render layout" do
        controller.expect_render(:action => 'new', :layout => false)
        do_xhr
      end
      
    end
  end

  describe "handling PUT /classrooms/1" do

    before(:each) do
      @classroom = mock_model(Classroom, :to_param => "1")
      Classroom.stub!(:find).and_return(@classroom)
    end
    
    describe "with successful update" do

      def do_put
        @classroom.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the classroom requested" do
        Classroom.should_receive(:find).with("1").and_return(@classroom)
        do_put
      end

      it "should update the found classroom" do
        do_put
        assigns(:classroom).should equal(@classroom)
      end

      it "should assign the found classroom for the view" do
        do_put
        assigns(:classroom).should equal(@classroom)
      end

      it "should redirect to the classroom" do
        do_put
        response.should redirect_to(classroom_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @classroom.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end
  
  describe "handling XHR PUT /classrooms/1" do

    before(:each) do
      @classroom = mock_model(Classroom, :to_param => "1")
      Classroom.stub!(:find).and_return(@classroom)
    end
    
    describe "with successful update" do

      def do_xhr
        @classroom.should_receive(:update_attributes).and_return(true)
        xhr :put, :update, :id => "1"
      end

      it "should find the classroom requested" do
        Classroom.should_receive(:find).with("1").and_return(@classroom)
        do_xhr
      end

      it "should update the found classroom" do
        do_xhr
        assigns(:classroom).should equal(@classroom)
      end

      it "should assign the found classroom for the view" do
        do_xhr
        assigns(:classroom).should equal(@classroom)
      end

      it "should redirect to the classroom" do
        do_xhr
        response.should render_template('common/redirect_to_collection')
      end

    end
    
    describe "with failed update" do

      def do_xhr
        @classroom.should_receive(:update_attributes).and_return(false)
        xhr :put, :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_xhr
        response.should render_template('edit')
      end

      it "should not render layout" do
        controller.expect_render(:action => 'edit', :layout => false)
        do_xhr
      end
      
    end
  end

  describe "handling DELETE /classrooms/1" do

    before(:each) do
      @classroom = mock_model(Classroom, :destroy => true)
      Classroom.stub!(:find).and_return(@classroom)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the classroom requested" do
      Classroom.should_receive(:find).with("1").and_return(@classroom)
      do_delete
    end
  
    it "should call destroy on the found classroom" do
      @classroom.should_receive(:destroy).and_return(true) 
      do_delete
    end
  
    it "should redirect to the classrooms list" do
      do_delete
      response.should redirect_to(classrooms_url)
    end
  end
end
