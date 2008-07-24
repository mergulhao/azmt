module ApplicationHelper
  def title
    'Default title! Override it!'
  end
  
  def create_button_and_cancel_link_to_clear_box_form
    submit_button(_('Create')) +
      link_to_clear_box_form
  end
  
  def update_button_and_cancel_link_to_clear_box_form
    submit_button(_('Update')) +
      link_to_clear_box_form
  end
  
  def submit_button(label)
    result = []
    result << '<label class="x-small lblbutton">'
    result << submit_tag(label, :class => "button")
    result << '</label>'
    result.join
  end
  
  def link_to_clear_box_form
    result = []
    result << '<label class="x-small" style="text-align: right;">'
    result << link_to_function('Cancelar', 'clearBoxForm()')
    result << '</label>'
    result.join
  end
  
  def flash_notice
    if flash[:notice]
      content_tag :p, flash[:notice]
    end
  end
end
