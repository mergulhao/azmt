require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CoursesController do
  should_have_ajaxian_responses_enabled
  
  describe "handling GET /courses" do

    before(:each) do
      @course = mock_model(Course)
      Course.stub!(:find).and_return([@course])
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
  
    it "should find all courses" do
      Course.should_receive(:find).with(:all).and_return([@course])
      do_get
    end
  
    it "should assign the found courses for the view" do
      do_get
      assigns[:courses].should == [@course]
    end
  end

  describe "handling GET /courses/1" do

    before(:each) do
      @course = mock_model(Course)
      Course.stub!(:find).and_return(@course)
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
  
    it "should find the course requested" do
      Course.should_receive(:find).with("1").and_return(@course)
      do_get
    end
  
    it "should assign the found course for the view" do
      do_get
      assigns[:course].should equal(@course)
    end
  end

  describe "handling GET /courses/new" do

    before(:each) do
      @course = mock_model(Course)
      Course.stub!(:new).and_return(@course)
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
  
    it "should create an new course" do
      Course.should_receive(:new).and_return(@course)
      do_get
    end
  
    it "should not save the new course" do
      @course.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new course for the view" do
      do_get
      assigns[:course].should equal(@course)
    end
  end

  describe "handling GET /courses/1/edit" do

    before(:each) do
      @course = mock_model(Course)
      Course.stub!(:find).and_return(@course)
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
  
    it "should find the course requested" do
      Course.should_receive(:find).and_return(@course)
      do_get
    end
  
    it "should assign the found Courses for the view" do
      do_get
      assigns[:course].should equal(@course)
    end
  end

  describe "handling POST /courses" do

    before(:each) do
      @course = mock_model(Course, :to_param => "1")
      Course.stub!(:new).and_return(@course)
    end
    
    describe "with successful save" do
  
      def do_post
        @course.should_receive(:save).and_return(true)
        post :create, :course => {}
      end
  
      it "should create a new course" do
        Course.should_receive(:new).with({}).and_return(@course)
        do_post
      end

      it "should redirect to the new course" do
        do_post
        response.should redirect_to(course_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @course.should_receive(:save).and_return(false)
        post :create, :course => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /courses/1" do

    before(:each) do
      @course = mock_model(Course, :to_param => "1")
      Course.stub!(:find).and_return(@course)
    end
    
    describe "with successful update" do

      def do_put
        @course.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the course requested" do
        Course.should_receive(:find).with("1").and_return(@course)
        do_put
      end

      it "should update the found course" do
        do_put
        assigns(:course).should equal(@course)
      end

      it "should assign the found course for the view" do
        do_put
        assigns(:course).should equal(@course)
      end

      it "should redirect to the course" do
        do_put
        response.should redirect_to(course_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @course.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /courses/1" do

    before(:each) do
      @course = mock_model(Course, :destroy => true)
      Course.stub!(:find).and_return(@course)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the course requested" do
      Course.should_receive(:find).with("1").and_return(@course)
      do_delete
    end
  
    it "should call destroy on the found course" do
      @course.should_receive(:destroy).and_return(true) 
      do_delete
    end
  
    it "should redirect to the courses list" do
      do_delete
      response.should redirect_to(courses_url)
    end
  end
end
