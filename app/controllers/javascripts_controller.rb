class JavascriptsController < ApplicationController
  def dynamic_teachers
    @teachers = Teacher.find(:all)
    @disciplines = Discipline.find(:all)
  end
end
