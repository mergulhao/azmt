class StudentsController < ResourceController::Base
  use_ajaxian_responses
  
  new_action.before do
    object.address_state = 'Rio de Janeiro'
    object.address_city = 'Rio de Janeiro'
  end
end
