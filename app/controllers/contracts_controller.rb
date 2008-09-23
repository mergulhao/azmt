class ContractsController < ResourceController::Base
  new_action.before do
    student = Student.find(params[:student_id])
    object.name = student.name
    
    object.address_street = student.address_street
    object.address_number = student.address_number
    object.address_complement = student.address_complement
    object.address_neighbourhood = student.address_neighbourhood
    object.address_zip = student.address_zip
    
    object.home_phone = student.home_phone
    object.comercial_phone = student.comercial_phone
    object.mobile_phone = student.mobile_phone
    
    object.cpf = student.cpf
    object.rg = student.rg
    
    object.student = student
  end

  create.before do
    object.student = Student.find(params[:student_id])
  end
  
  update.before do
    params[:contract] ||= {}
    params[:contract][:existing_installment_attributes] ||= {}
  end
end
