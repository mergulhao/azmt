# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def title
    'Default title! Override it!'
  end
  
  def flash_notice
    if flash[:notice]
      content_tag :p, flash[:notice]
    end
  end
end
