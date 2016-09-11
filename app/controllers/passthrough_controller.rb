class PassthroughController < ApplicationController
  def index
    path = case current_teacher.role
      when 'admin'
        home_index_path
      when 'teacher'
        teacher_students_path(current_teacher)
      else
        # If you want to raise an exception or have a default root for users without roles
    end

    redirect_to path     
  end
end
