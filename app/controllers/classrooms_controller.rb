class ClassroomsController < ResourceController::Base
  new_action.wants.js { render :layout => false }

  create do
    flash "Classroom successfully created!"
    wants.js
    failure.wants.js { render :action => 'new', :layout => false }
  end
end
