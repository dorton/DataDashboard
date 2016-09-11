class ObservationsController < ApplicationController

  def index
    @teacher = Teacher.find(params[:teacher_id])
    @students = @teacher.students.find(params[:student_id])
    @observations = @students.observations.all
  end

  def new
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.find(params[:student_id])
    @observation = @student.observations.new
  end

  def show
    @teacher = Teacher.find(params[:teacher_id])
    @students = @teacher.students.find(params[:student_id])
    @observations = @students.observations.find(params[:id])
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.find(params[:student_id])
    @observation = @student.observations.create(params[:observation].merge({:observer => current_teacher.full_name}).merge({:campus => current_teacher.campus}))

    respond_to do |format|
      if @observation.save
        format.html { redirect_to :back, notice: 'Observation was successfully created.' }
        
      else
        format.html { render action: "new" }
        
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @teacher = Teacher.find(params[:teacher_id])
    @students = @teacher.students.find(params[:student_id])
    @observation = Observation.find(params[:id])
    @observation.destroy

    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end
end
