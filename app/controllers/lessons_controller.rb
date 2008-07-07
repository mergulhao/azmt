class LessonsController < ResourceController::Base
  belongs_to :discipline
  
  private
  index.before do
    unless params[:teacher_id].blank?
      @lessons = @lessons.select { |lesson| lesson.teacher_id == params[:teacher_id].to_i }
    end
    
    unless params[:classroom_id].blank?
      @lessons = @lessons.select { |lesson| lesson.classroom_id == params[:classroom_id].to_i }
    end
  end
  
  def collection
    @start_date = params[:start_date].to_date rescue Date.today.beginning_of_month
    @end_date = params[:end_date].to_date rescue Date.today.end_of_month
    @collection ||= end_of_association_chain.find(:all, 
      :conditions => ["datetime_start >= ? and datetime_end <= ?", @start_date, @end_date], 
      :order => 'datetime_start'
    )
  end
end
