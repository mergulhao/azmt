require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Classe do

  describe "attributes" do
    before(:each) do
      @classe = Classe.new
      @classe.valid?
    end
    
    it "requires course" do
      @classe.errors.on(:course).should_not be_nil
    end
    
    it "requires name" do
      @classe.errors.on(:name).should_not be_nil
    end
  end
  
  describe ".to_s" do
    it "should return course name and classe name" do
      classes(:first_semester_sexology).to_s.should eql('Sexology in details - First Semester')
    end
  end
  
  describe "lessons assignment" do
    def classe
      @classe ||= classes(:first_semester_sexology)
    end

    it "should handle existing_lesson_attributes=" do
      lesson = classe.lessons.first
      
      lesson.date.should eql(Date.new(2008,7,4))
      lesson.start_time.strftime('%H:%M').should eql('09:00')
      lesson.end_time.strftime('%H:%M').should eql('12:00')
      lesson.discipline.should eql(disciplines(:sexology))
      
      classe.lessons.size.should eql(1)
      classe.existing_lesson_attributes = {
        "#{lesson.id}" => {
          :discipline => disciplines(:math),
          :date => Date.new(2008,7,5),
          :start_time => "10:00",
          :end_time => "13:00"
        }
      }
      
      classe.save.should be_true
      classe.reload
      classe.lessons.size.should eql(1)
      
      lesson = classe.lessons.first
      lesson.discipline.should eql(disciplines(:math))
      lesson.date.should eql(Date.new(2008,7,5))
      lesson.start_time.strftime('%H:%M').should eql('10:00')
      lesson.end_time.strftime('%H:%M').should eql('13:00')
    end
    
    it "should handle new_lesson_attributes=" do
      classroom = classrooms(:amazonia)
      discipline = disciplines(:sexology)
      teacher = teachers(:homer)
      
      date1 = Date.new(2008,5,2)
      date2 = Date.new(2008,5,5)
      start_time = "10:00"
      end_time = "14:00"
      
      classe.lessons.size.should eql(1)
      classe.new_lesson_attributes = [
          {
            :classroom => classroom,
            :discipline => discipline,
            :teacher => teacher,
            :date => date1,
            :start_time => start_time,
            :end_time => end_time
          },{
            :classroom => classroom,
            :discipline => discipline,
            :teacher => teacher,
            :date => date2,
            :start_time => start_time,
            :end_time => end_time
          }
      ]
      
      classe.save.should be_true
      classe.reload
      classe.lessons.size.should eql(3)
    end
  end
end
