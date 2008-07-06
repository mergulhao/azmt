require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe LessonsController do
  fixtures :disciplines, :lessons

  before(:each) do
    Date.stub!(:today).and_return(Date.new(2008,07,04))
  end
  
  describe "handling GET /lessons with parameters" do
    def do_get(params = {})
      get :index, params
    end

    it "should return only lessons on requested period" do
      do_get :start_date => '05/08/2008', :end_date => '25/08/2008'
      assigns[:lessons].should == lessons(:calculus, :algebra)
      assigns[:start_date].should eql(Date.new(2008,8,5))
      assigns[:end_date].should eql(Date.new(2008,8,25))
    end
    
    it "should ignore if end_date is not passed" do
      Lesson.should_receive(:find).
        with(:all, {:conditions => ["datetime_start >= ? and datetime_end <= ?", Date.new(2008,8,5), Date.today.end_of_month], :order => "datetime_start"}).
        and_return([@lesson])
      do_get :start_date => '05/08/2008'
    end
    
    it "should ignore if start_date is not passed" do
      Lesson.should_receive(:find).
        with(:all, {:conditions => ["datetime_start >= ? and datetime_end <= ?", Date.today.beginning_of_month, Date.new(2008,8,5)], :order => "datetime_start"}).
        and_return([@lesson])
      do_get :end_date => '05/08/2008'
    end

    it "should not break if start_date or end_date are truncated" do
      Lesson.should_receive(:find).
        with(:all, {:conditions=>["datetime_start >= ? and datetime_end <= ?", Date.today.beginning_of_month, Date.today.end_of_month], :order => "datetime_start"}).
        and_return([@lesson])
      do_get :start_date => 'Ab/08/2008', :end_date => '05/Cd/2008'
    end
  end
  
  describe "handling GET /lessons" do

    before(:each) do
      @lesson = mock_model(Lesson)
      Lesson.stub!(:find).and_return([@lesson])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful and assigns @start_date and @end_date" do
      do_get
      response.should be_success
      assigns(:start_date).should eql(Date.new(2008,7,1))
      assigns(:end_date).should eql(Date.new(2008,7,31))
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all lessons" do
      Lesson.should_receive(:find).with(:all, {:conditions=>["datetime_start >= ? and datetime_end <= ?", Date.today.beginning_of_month, Date.today.end_of_month], :order => "datetime_start"}).and_return([@lesson])
      do_get
    end
  
    it "should assign the found lessons for the view" do
      do_get
      assigns[:lessons].should == [@lesson]
    end
  end

  describe "handling GET /lessons/1" do

    before(:each) do
      @lesson = mock_model(Lesson)
      Lesson.stub!(:find).and_return(@lesson)
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
  
    it "should find the lesson requested" do
      Lesson.should_receive(:find).with("1").and_return(@lesson)
      do_get
    end
  
    it "should assign the found lesson for the view" do
      do_get
      assigns[:lesson].should equal(@lesson)
    end
  end

  describe "handling GET /lessons/new" do

    before(:each) do
      @lesson = mock_model(Lesson)
      Lesson.stub!(:new).and_return(@lesson)
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
  
    it "should create an new lesson" do
      Lesson.should_receive(:new).and_return(@lesson)
      do_get
    end
  
    it "should not save the new lesson" do
      @lesson.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new lesson for the view" do
      do_get
      assigns[:lesson].should equal(@lesson)
    end
  end

  describe "handling GET /lessons/1/edit" do

    before(:each) do
      @lesson = mock_model(Lesson)
      Lesson.stub!(:find).and_return(@lesson)
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
  
    it "should find the lesson requested" do
      Lesson.should_receive(:find).and_return(@lesson)
      do_get
    end
  
    it "should assign the found Lessons for the view" do
      do_get
      assigns[:lesson].should equal(@lesson)
    end
  end

  describe "handling POST /lessons" do

    before(:each) do
      @lesson = mock_model(Lesson, :to_param => "1")
      Lesson.stub!(:new).and_return(@lesson)
    end
    
    describe "with successful save" do
  
      def do_post
        @lesson.should_receive(:save).and_return(true)
        post :create, :lesson => {}
      end
  
      it "should create a new lesson" do
        Lesson.should_receive(:new).with({}).and_return(@lesson)
        do_post
      end

      it "should redirect to the new lesson" do
        do_post
        response.should redirect_to(lesson_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @lesson.should_receive(:save).and_return(false)
        post :create, :lesson => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /lessons/1" do

    before(:each) do
      @lesson = mock_model(Lesson, :to_param => "1")
      Lesson.stub!(:find).and_return(@lesson)
    end
    
    describe "with successful update" do

      def do_put
        @lesson.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the lesson requested" do
        Lesson.should_receive(:find).with("1").and_return(@lesson)
        do_put
      end

      it "should update the found lesson" do
        do_put
        assigns(:lesson).should equal(@lesson)
      end

      it "should assign the found lesson for the view" do
        do_put
        assigns(:lesson).should equal(@lesson)
      end

      it "should redirect to the lesson" do
        do_put
        response.should redirect_to(lesson_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @lesson.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /lessons/1" do

    before(:each) do
      @lesson = mock_model(Lesson, :destroy => true)
      Lesson.stub!(:find).and_return(@lesson)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the lesson requested" do
      Lesson.should_receive(:find).with("1").and_return(@lesson)
      do_delete
    end
  
    it "should call destroy on the found lesson" do
      @lesson.should_receive(:destroy).and_return(true) 
      do_delete
    end
  
    it "should redirect to the lessons list" do
      do_delete
      response.should redirect_to(lessons_url)
    end
  end
end
