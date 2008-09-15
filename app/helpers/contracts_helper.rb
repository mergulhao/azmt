module ContractsHelper

  def add_installment_link
    link_to_function _('Add %s', _('Installment')) do |page|
      page.insert_html :bottom, :installments, :partial => 'installment', :object => Installment.new
    end
  end
end
