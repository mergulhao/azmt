class ContractsController < ResourceController::Base
  new_action.before do
    @student = Student.find(params[:student_id])
    object.name = @student.name
    
    object.address_street = @student.street
    object.address_number = @student.number
    object.address_complement = @student.complement
    object.address_neighbourhood = @student.neighbourhood
    object.address_zip = @student.zip
    
    object.home_phone = @student.home_phone
    object.comercial_phone = @student.comercial_phone
    object.mobile_phone = @student.mobile_phone
    
    object.cpf = @student.cpf
    
    object.student = @student
  end
end
