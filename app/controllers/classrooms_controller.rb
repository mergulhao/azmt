class ClassroomsController < ResourceController::Base
  new_action.wants.js { render :layout => false }

  edit do
    wants.js { render :layout => false }
  end

  update do
    flash "Classroom successfully updated!"
    wants.js { render :template => 'common/redirect_to_collection' }
    failure.wants.js { render :action => 'edit', :layout => false }
  end
  
  create do
    flash "Classroom successfully created!"
    wants.js { render :template => 'common/redirect_to_collection' }
    failure.wants.js { render :action => 'new', :layout => false }
  end
end
