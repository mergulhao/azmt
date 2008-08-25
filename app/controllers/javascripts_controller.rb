class JavascriptsController < ApplicationController
  def dynamic_teachers
    @disciplines = Discipline.find(:all)
  end
end
