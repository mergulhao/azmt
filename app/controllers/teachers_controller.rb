class TeachersController < ResourceController::Base
  new_action.wants.js { render :layout => false }

  edit do
    wants.js { render :layout => false }
  end

  update do
    flash _('%s successfully updated!', _('Teacher'))
    wants.js { render :template => 'common/redirect_to_collection' }
    failure.wants.js { render :action => 'edit', :layout => false }
  end
  
  create do
    flash _('%s successfully created!', _('Teacher'))
    wants.js { render :template => 'common/redirect_to_collection' }
    failure.wants.js { render :action => 'new', :layout => false }
  end
end
