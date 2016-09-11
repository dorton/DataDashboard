class LearningwalksController < ApplicationController

  # GET /learningwalks
  # GET /learningwalks.json
  def index
    if current_teacher.teacher?
      @teacher = current_teacher
    else
      @teacher = Teacher.find(params[:teacher_id])
    end
    @learningwalks = @teacher.learningwalks.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @learningwalks }
    end
  end

  # GET /learningwalks/1
  # GET /learningwalks/1.json
  

  def show
    if current_teacher.teacher?
      @teacher = current_teacher
    else
    @teacher = Teacher.find(params[:teacher_id])
  end
    @learningwalk = @teacher.learningwalks.find(params[:id])
    render :layout => "print"
    
    
  end

  # GET /learningwalks/new
  # GET /learningwalks/new.json
  def new
    @teacher = Teacher.find(params[:teacher_id])
    @learningwalk = @teacher.learningwalks.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @learningwalk }
    end
  end

  # GET /learningwalks/1/edit
  def edit
    @teacher = Teacher.find(params[:teacher_id])
    @learningwalk = @teacher.learningwalks.find(params[:id])
  end

  # POST /learningwalks
  # POST /learningwalks.json
  def create
    @teacher = Teacher.find(params[:teacher_id])
    @learningwalk = @teacher.learningwalks.create(params[:learningwalk].merge({:observer => current_teacher.full_name}).merge({:campus => current_teacher.campus}))

    respond_to do |format|

      if @learningwalk.save
        
        format.html { redirect_to teacher_learningwalks_path(@teacher), notice: 'Observation was successfully created.' }
        format.json { render json: @learningwalk, status: :created, location: @learningwalk }
      else
        format.html { render action: "new" }
        format.json { render json: @learningwalk.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /learningwalks/1
  # PUT /learningwalks/1.json
  def update
    @teacher = Teacher.find(params[:teacher_id])
    @learningwalk = @teacher.learningwalks.find(params[:id])

    respond_to do |format|
      if @learningwalk.update_attributes(params[:learningwalk])
        format.html { redirect_to teacher_learningwalk_path(@teacher), notice: 'Observation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @learningwalk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learningwalks/1
  # DELETE /learningwalks/1.json
  def destroy
    @teacher = Teacher.find(params[:teacher_id])
    @learningwalk = @teacher.learningwalks.find(params[:id])
    @learningwalk.destroy

    respond_to do |format|
      format.html { redirect_to teacher_path(@teacher) }
      format.json { head :no_content }
    end
  end
  
  def mailer
    @teacher = Teacher.find(params[:teacher_id])
    @learningwalk = Learningwalk.find(params[:learningwalk_id])
    @current_teacher = current_teacher
    TeacherMailer.learning_walk(@teacher, @learningwalk, @current_teacher).deliver
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Learning walk was emailed to teacher.' }
    end
  end
  
end
