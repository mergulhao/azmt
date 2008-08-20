class ClassesController < ResourceController::Base
  create do
    wants.html { redirect_to classe_lessons_url(object) }
  end
#  use_ajaxian_responses
end
