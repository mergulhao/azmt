class Contract < ActiveRecord::Base
  belongs_to :student
  belongs_to :classe
  
  usar_como_dinheiro :registration_value, :installment_value
end
