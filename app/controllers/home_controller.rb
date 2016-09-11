class HomeController < ApplicationController
  def index

    @grades = [5, 4, 3, 2, 1, "K", "PK","LS","Ancillary"]
    @all_teachers = Teacher.where(campus: current_teacher.campus).order("last_name ASC")
  	@students = Student.search(params[:search])
  	@search = Search.new

    
  end
  


  def myobservations

    @learningwalk = Learningwalk.where("observer = ?", current_teacher.full_name)
  	@observation = Observation.where("observer = ?", current_teacher.full_name)
  	@teacher_learningwalk = current_teacher.learningwalks #Learningwalk.where("teacher_id = ?", current_teacher)
  	@teacher_observation = current_teacher.observations
    #Observation.where(student_id: current_teacher.id)#.where("student_id = ?", current_teacher)
  end

end
