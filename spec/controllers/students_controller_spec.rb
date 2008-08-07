require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StudentsController do
  describe "handling GET /students" do

    before(:each) do
      @student = mock_model(Student)
      Student.stub!(:find).and_return([@student])
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
  
    it "should find all students" do
      Student.should_receive(:find).with(:all).and_return([@student])
      do_get
    end
  
    it "should assign the found students for the view" do
      do_get
      assigns[:students].should == [@student]
    end
  end

  describe "handling GET /students/1" do

    before(:each) do
      @student = mock_model(Student)
      Student.stub!(:find).and_return(@student)
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
  
    it "should find the student requested" do
      Student.should_receive(:find).with("1").and_return(@student)
      do_get
    end
  
    it "should assign the found student for the view" do
      do_get
      assigns[:student].should equal(@student)
    end
  end

  describe "handling GET /students/new" do

    before(:each) do
      @student = mock_model(Student)
      Student.stub!(:new).and_return(@student)
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
  
    it "should create an new student" do
      Student.should_receive(:new).and_return(@student)
      do_get
    end
  
    it "should not save the new student" do
      @student.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new student for the view" do
      do_get
      assigns[:student].should equal(@student)
    end
  end

  describe "handling GET /students/1/edit" do

    before(:each) do
      @student = mock_model(Student)
      Student.stub!(:find).and_return(@student)
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
  
    it "should find the student requested" do
      Student.should_receive(:find).and_return(@student)
      do_get
    end
  
    it "should assign the found Students for the view" do
      do_get
      assigns[:student].should equal(@student)
    end
  end

  describe "handling POST /students" do

    before(:each) do
      @student = mock_model(Student, :to_param => "1")
      Student.stub!(:new).and_return(@student)
    end
    
    describe "with successful save" do
  
      def do_post
        @student.should_receive(:save).and_return(true)
        post :create, :student => {}
      end
  
      it "should create a new student" do
        Student.should_receive(:new).with({}).and_return(@student)
        do_post
      end

      it "should redirect to the new student" do
        do_post
        response.should redirect_to(student_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @student.should_receive(:save).and_return(false)
        post :create, :student => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /students/1" do

    before(:each) do
      @student = mock_model(Student, :to_param => "1")
      Student.stub!(:find).and_return(@student)
    end
    
    describe "with successful update" do

      def do_put
        @student.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the student requested" do
        Student.should_receive(:find).with("1").and_return(@student)
        do_put
      end

      it "should update the found student" do
        do_put
        assigns(:student).should equal(@student)
      end

      it "should assign the found student for the view" do
        do_put
        assigns(:student).should equal(@student)
      end

      it "should redirect to the student" do
        do_put
        response.should redirect_to(student_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @student.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /students/1" do

    before(:each) do
      @student = mock_model(Student, :destroy => true)
      Student.stub!(:find).and_return(@student)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the student requested" do
      Student.should_receive(:find).with("1").and_return(@student)
      do_delete
    end
  
    it "should call destroy on the found student" do
      @student.should_receive(:destroy).and_return(true) 
      do_delete
    end
  
    it "should redirect to the students list" do
      do_delete
      response.should redirect_to(students_url)
    end
  end
end
