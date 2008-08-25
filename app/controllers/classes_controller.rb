class ClassesController < ResourceController::Base
  new_action.wants.js { render :layout => false }

  create do
    wants.js
    failure.wants.js { render :action => 'new', :layout => false }
  end
  
  update do
    wants.html { redirect_to edit_object_url(object) }
  end

  update.before do
    (params[:classe][:existing_lesson_attributes] ||= {}) if params[:classe]
  end
end
