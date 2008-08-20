module AjaxianResponses
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def use_ajaxian_responses
      new_action.wants.js { render :layout => false }

      edit do
        wants.js { render :layout => false }
      end

      update do
        flash _('Successfully updated!')
        wants.js { render :template => 'common/redirect_to_collection' }
        failure.wants.js { render :action => 'edit', :layout => false }
      end

      create do
        flash _('Successfully created!')
        wants.js { render :template => 'common/redirect_to_collection' }
        failure.wants.js { render :action => 'new', :layout => false }
      end
    end
  end
end

ActionController::Base.send :include, AjaxianResponses
