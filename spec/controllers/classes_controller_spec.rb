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
        response.should redirect_to(edit_classe_url("1"))
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
  
  describe "handling PUT /classes/:id with multiple lessons" do
    fixtures :courses, :classrooms, :teachers, :disciplines, :classes, :lessons

    before(:each) do
      @classe = classes(:first_semester_math)
    end
    
    def do_put(params)
      put :update, :id => @classe.id, :classe => params
    end

#    it "should update old lessons in existing_lesson_attributes" do
#      lesson = @classe.lessons.first
#      lesson.date.should eql(Date.new(2008,07,05))
#      lesson.start_time.strftime('%H:%M').should eql('09:00')
#      lesson.end_time.strftime('%H:%M').should eql('12:00')
#      
#      start_time = "10:00"
#      end_time = "13:00"
#      date = "2008-07-30"
##      date = "30/07/2008"
#      
#      params = {
#        :course_id => courses(:sexology).id, 
#        :existing_lesson_attributes => {
#          "#{lesson.id}" => {
#            "discipline_id" => lesson.discipline_id,
#            "start_time" => start_time,
#            "end_time" => end_time,
#            "date" => date,
#            "classroom_id" => lesson.classroom_id,
#            "teacher_id" => lesson.teacher_id
#          },
#        }
#      }
#      
#      @classe.course.id.should eql(courses(:math).id)
#      @classe.lessons.size.should eql(5)
#      
#      do_put(params)
#
#      assigns(:classe).should_not be_nil
#      assigns(:classe).course.id.should eql(courses(:sexology).id)
#      assigns(:classe).lessons.size.should eql(1)
#
#      lesson = assigns(:classe).lessons.first
#      
#      p lesson.read_attribute(:date)
#      p lesson.date
#      p lesson.instance_variable_get(:@attributes)
#      p lesson.instance_variable_get(:@attributes_cache)
#      
#      p lesson.save!
#      lesson.reload
#
#      p lesson.read_attribute(:date)
#      p lesson.date
#      p lesson.instance_variable_get(:@attributes)
#      p lesson.instance_variable_get(:@attributes_cache)
#
#      lesson.date.should eql(date.to_date)
#      lesson.start_time.strftime('%H:%M').should eql(start_time)
#      lesson.end_time.strftime('%H:%M').should eql(end_time)
#
#      a = Lesson.find(lesson.id)
#      p a
#    end
    
    it "should delete old lessons not in existing_lesson_attributes" do
      Lesson.count.should eql(6)
      
      @classe.lessons.size.should eql(5)
      do_put({})
      @classe.lessons.size.should eql(0)
      
      Lesson.count.should eql(1)
    end
    
    it "should create lessons of new_lesson_attributes" do
      @classe.lessons.size.should eql(5)
      
      discipline_id = disciplines(:math).id
      classroom_id = classrooms(:amazonia).id 
      teacher_id = teachers(:marge).id
      start_time = "10:00:00"
      end_time = "13:00:00"
      
      date1 = "24/05/2008"
      date2 = "31/05/2008"
      
      params = {
        :new_lesson_attributes => [
           {
            "discipline_id" => discipline_id,
            "start_time" => start_time,
            "end_time" => end_time,
            "date" => date1,
            "classroom_id" => classroom_id,
            "teacher_id" => teacher_id
          },
          {
            "discipline_id" => discipline_id,
            "start_time" => start_time,
            "end_time" => end_time,
            "date" => date2,
            "classroom_id" => classroom_id,
            "teacher_id" => teacher_id
          },
        ]
      }
      
      do_put(params)
      @classe.lessons.size.should eql(2)
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
