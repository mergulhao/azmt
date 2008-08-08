require 'multiple_select'

ActionView::Base.send(:include, FightTheMelons::Helpers::FormMultipleSelectHelper)
FightTheMelons::Helpers::FormMultipleSelectHelperConfiguration.list_tags = ['div', 'div']