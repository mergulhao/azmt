module ActionView
  module Helpers
    module UrlHelper
      private
      def convert_options_to_javascript_with_model_box!(html_options, url = '')
        confirm = html_options.delete("confirm")
        if confirm
          modal_box_js = "Modalbox.show('<div>"
          modal_box_js << button_to("Continuar", url, html_options)
          modal_box_js << "&nbsp;&nbsp;&nbsp;"
          modal_box_js << button_to_function("Cancelar", "Modalbox.hide()")
          modal_box_js << "</div>', {title: 'Confirmation: #{escape_javascript(confirm)}', width: 250}); return false;"
          html_options.delete("method")
          html_options["onclick"] = modal_box_js
        else
          convert_options_to_javascript_without_model_box!(html_options, url = '')
        end
      end
      
      alias_method_chain :convert_options_to_javascript!, :model_box
    end
  end
end