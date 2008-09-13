class Installment < ActiveRecord::Base
  belongs_to :contract
  usar_como_dinheiro :value
end
