class Contract < ActiveRecord::Base
  belongs_to :student
  belongs_to :classe
  has_many :installments, :order => 'due_date ASC'
  
  usar_como_dinheiro :registration_value, :installment_value
  
  def number
    id.to_s.rjust(5, '0')
  end

  validates_associated :installments
  after_update :save_installments
  
  def new_installment_attributes=(installment_attributes)
    installment_attributes.each do |attributes|
      installments.build(attributes)
    end
  end

  def existing_installments_attributes=(installment_attributes)
    installments.reject(&:new_record?).each do |installment|
      attributes = installment_attributes[installment.id.to_s]
      if attributes
        installment.attributes = attributes
      else
        installments.destroy(installment)
      end
    end
  end

  private
  def save_installments
    installments.each do |installment|
      installment.save(false)
    end
  end
end
