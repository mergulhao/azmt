class LessonsController < ResourceController::Base
  belongs_to :classe

  private
  index.before do
      unless params[:teacher_id].blank?
        @lessons = @lessons.select { |lesson| lesson.teacher_id == params[:teacher_id].to_i }
      end
    
      unless params[:classroom_id].blank?
        @lessons = @lessons.select { |lesson| lesson.classroom_id == params[:classroom_id].to_i }
      end
    
      unless params[:classe_id].blank?
        @lessons = @lessons.select { |lesson| lesson.classe_id == params[:classe_id].to_i }
      end
  end
  
  def collection
      @start_date = params[:start_date].to_date rescue Date.today.beginning_of_week
      @end_date = params[:end_date].to_date rescue Date.today.beginning_of_week + 2.week
      @collection ||= end_of_association_chain.find(:all, 
        :conditions => ["date >= ? and date <= ?", @start_date, @end_date], 
        :order => 'date, start_time'
      )
  end
end
