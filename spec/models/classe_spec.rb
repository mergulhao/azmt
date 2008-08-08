require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Classe do
  fixtures :classes, :classrooms, :teachers, :disciplines
  
  describe "defaults tests" do
    before(:each) do
      @classe = Classe.new
    end

    it "should not be valid" do
      @classe.should_not be_valid
      
      error_messages = ["Start date can't be blank", "Classroom can't be blank", "Lessons number can't be blank", "Teacher can't be blank", "Repeat on must be a day of week", "Discipline can't be blank", "End time can't be blank", "Start time can't be blank"]
      @classe.errors.full_messages.should eql(error_messages)
    end

    it "should validates end_time after start_time" do
      @classe.start_time = "10:00"
      @classe.end_time = "9:00"
      @classe.should_not be_valid
    
      @classe.errors.on(:start_time).should be_nil
      @classe.errors.on(:end_time).should eql('must be after 10:00:00')
    end
  end
  
  describe ".to_s" do
    it "should return formatted to_s" do
      classes(:first_semester_math).to_s.should eql('Math with Marge Bouvier Simpson, start date: 09/06/2008')
      classes(:first_semester_sexology).to_s.should eql('Sexology with Homer J. Simpson, start date: 06/06/2008')
    end
  end
  
  describe "handling lessons on create" do
    
    describe "default cases" do
      before(:each) do
        @start_date = Date.new(2008,2,1)
        @start_time = Time.mktime(2008, 1, 1, 9, 0)
        @end_time = Time.mktime(2008, 1, 1, 13, 0)
        @repeat_on = :thursday
        @lessons_number = 4
        @classe = Classe.new(:start_date => @start_date, 
          :start_time => @start_time, 
          :end_time => @end_time, 
          :repeat_on => @repeat_on, 
          :classroom => classrooms(:amazonia),
          :discipline => disciplines(:math), 
          :teacher => teachers(:marge), 
          :lessons_number => @lessons_number)
      end

      it "should be invalid if the discipline cannot be taught by the teacher" do
        @classe.teacher = teachers(:homer)
        @classe.should_not be_valid
        @classe.errors.on(:teacher_id).should eql('cannot teach this discipline')
      end
      
      it "should generate lessons" do
        dates = [[2008,2,7], [2008,2,14], [2008,2,21], [2008,2,28]]
        @classe.lessons.size.should eql(4)
        @classe.lessons.each_with_index do |lesson, i|
          ano = dates[i][0]
          mes = dates[i][1]
          dia = dates[i][2]
          date = Date.new(ano, mes, dia)

          lesson.date.to_date.should eql(date)
        
          lesson.start_time.hour.should eql(9)
          lesson.start_time.min.should  eql(0)
        
          lesson.end_time.hour.should   eql(13)
          lesson.end_time.min.should    eql(0)
        end
      end
    
      it "should validates repeat_on using valid week days" do
        @classe.should be_valid
        [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday].each do |repeat_on|
          @classe.repeat_on = repeat_on
          @classe.should be_valid
        end
      
        [:icecream, :juice, 7, 'cofee'].each do |repeat_on|
          @classe.repeat_on = repeat_on
          @classe.should_not be_valid
          @classe.errors.on(:repeat_on).should eql('must be a day of week')
        end
      end
    
      it "should know keys values to generate lessons" do
        @classe.start_date.to_date.should eql(@start_date)
        @classe.start_time.should eql(@start_time)
        @classe.end_time.should eql(@end_time)
        @classe.repeat_on.should eql(@repeat_on)
        @classe.lessons_number.should eql(@lessons_number)
      end      
    end
    
    describe "border case" do
      it "should generate the first lesson on the same day" do
        classe = Classe.new(:start_date => Date.new(2008,7,3), 
          :start_time => Time.mktime(2008, 1, 1, 18, 30), 
          :end_time => Time.mktime(2008, 1, 1, 22, 45), 
          :repeat_on => :thursday, 
          :lessons_number => 3)

        dates = [[2008,7,3], [2008,7,10], [2008,7,17]]
        classe.lessons.size.should eql(3)
        classe.lessons.each_with_index do |lesson, i|
          ano = dates[i][0]
          mes = dates[i][1]
          dia = dates[i][2]
          date = Date.new(ano, mes, dia)

          lesson.date.to_date.should eql(date)
        
          lesson.start_time.hour.should eql(18)
          lesson.start_time.min.should  eql(30)
        
          lesson.end_time.hour.should   eql(22)
          lesson.end_time.min.should    eql(45)
        end

      end
    end
  end
end
