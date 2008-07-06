class LessonsController < ResourceController::Base
  belongs_to :discipline
  
  private
  def collection
    @start_date = params[:start_date].to_date rescue Date.today.beginning_of_month
    @end_date = params[:end_date].to_date rescue Date.today.end_of_month
    @collection ||= end_of_association_chain.find(:all, 
      :conditions => ["datetime_start >= ? and datetime_end <= ?", @start_date, @end_date], 
      :order => 'datetime_start'
    )
  end
end
