class ClassesController < ResourceController::Base
  create do
    wants.html { redirect_to classe_lessons_url(object) }
  end

  update.before do
    (params[:classe][:existing_lesson_attributes] ||= {}) if params[:classe]
  end
end
