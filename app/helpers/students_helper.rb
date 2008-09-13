module StudentsHelper
  def title
    _('Students')
  end
  
  def css_to_contract_installments(contract)
    result = []
    result << 'class="'
    result << css_class_to_contract_installments(contract)
    result << '" style="display: none;"'
    result.join
  end
  
  def css_class_to_contract_installments(contract)
    contract.dom_id('installments')
  end
end
