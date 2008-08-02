module ApplicationHelper
  def title
    'Default title! Override it!'
  end
  
  def title_edit(object)
    content_tag :h3, _('Editing %s', _(object.to_s.capitalize))
  end
  
  def title_new(object)
    content_tag :h3, _('New %s', _(object.to_s.capitalize))
  end
  
  def create_button_and_cancel_link_to_clear_box_form
    submit_button(_('Create')) +
      link_to_clear_box_form
  end
  
  def update_button_and_cancel_link_to_clear_box_form
    submit_button(_('Update')) +
      link_to_clear_box_form
  end

  def link_add_to_remote
    link_to_remote image_tag('icons/file_add.png') + " " + _('Add'), :update => "box_form", :url => new_object_url, :method => :get
  end
  
  def link_edit_to_remote(object)
    link_to_remote image_tag('icons/file_edit.png'), :update => "box_form", :url => edit_object_url(object), :method => :get
  end
  
  def link_delete(object)
    link_to image_tag('icons/file_delete.png'), object_url(object), :confirm => _('You will delete it permanently. Are you sure?'), :method => :delete
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
      content_tag :p, flash[:notice], "class" => "infoExplanation"
    end
  end
  
  def error_messages_for(object_name, options = {})
    options = options.symbolize_keys
    object = instance_variable_get("@#{object_name}")
    if object && !object.errors.empty?
      content_tag("div",
      content_tag(
      options[:header_tag] || "strong",
      "#{object.errors.count} erro(s) encontrados"
      ) +
      content_tag("ul", object.errors.full_messages.collect { |msg| content_tag("li", msg) }),
      "id" => options[:id] || "errorExplanation", "class" => options[:class] || "errorExplanation"
      )
    else
      ""
    end
  end
end
