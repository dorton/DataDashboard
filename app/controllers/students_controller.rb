class StudentsController < ApplicationController
  def index
    if current_teacher.teacher?
      @teacher = current_teacher
    else
      @teacher = Teacher.find(params[:teacher_id])
    end
    if @teacher.departmental?
      @students = Student.where("depart_class = ?", @teacher.depart_class).all :order => 'last_name ASC'
    else
      @students = @teacher.students.where("campus = ?", current_teacher.campus).all
    end
   if @teacher.departmental?
      @ayp_math = Student.where("depart_class = ? AND met_math_ayp = ?", @teacher.depart_class, false)
      @ayp_reading = Student.where("depart_class = ? AND met_reading_ayp = ?", @teacher.depart_class, false)
    else
      @ayp_math = Student.where("teacher_id = ? AND met_math_ayp = ?", @teacher, false)
      @ayp_reading = Student.where("teacher_id = ? AND met_reading_ayp = ?", @teacher, false)
    end
    @third = @teacher.grade["3"] 
    @fourth = @teacher.grade["4"] 
    @fifth = @teacher.grade["5"]

     
     respond_to do |format|
    format.html
    format.csv { send_data teacher.students.to_csv }
    format.xls # { send_data @students.to_csv(col_sep: "\t") }


  end
    


  end

  def show
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.find(params[:id])
    @observation = @student.observations.new
    @observations = @student.observations.all

# ****************************MATH CHART****************************

    math_table = GoogleVisualr::DataTable.new
    # Add Column Headers
    math_table.new_column('string', 'Category' )
    math_table.new_column('number', 'Percent Correct')
    # Add Rows and Values
    math_table.add_rows([
      ['Cat 1', @student.math_cat_1.to_i],
      ['Cat 2', @student.math_cat_2.to_i],
      ['Cat 3', @student.math_cat_3.to_i],
      ['Cat 4', @student.math_cat_4.to_i],
      ['Cat 5', @student.math_cat_5.to_i]
    ])
    option = { width: 350, 
               height: 240, 
               hAxis:{maxValue: 100}, 
               hAxis:{minValue: 0}, 
               vAxis: {title: "Math Category"},
               hAxis: {title: "Percent Correct"},
               legend: {position: "left"} 
             }
    @math_chart = GoogleVisualr::Interactive::BarChart.new(math_table, option)

# ****************************Reading CHART****************************

    reading_table = GoogleVisualr::DataTable.new
    # Add Column Headers
    reading_table.new_column('string', 'Category' )
    reading_table.new_column('number', 'Percent Correct')
    # Add Rows and Values
    reading_table.add_rows([
      ['Cat 1', @student.elar_cat_1.to_i],
      ['Cat 2', @student.elar_cat_2.to_i],
      ['Cat 3', @student.elar_cat_3.to_i]
    ])
    option = { width: 350, 
               height: 240, 
               hAxis:{maxValue: 100}, 
               hAxis:{minValue: 0}, 
               vAxis: {title: "Reading Category"},
               hAxis: {title: "Percent Correct"} ,
               legend: {position: "left"}
             }
    @reading_chart = GoogleVisualr::Interactive::BarChart.new(reading_table, option)

# ********************************************************************

  end

  def new
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.new
  end

  def edit
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.find(params[:id])
  end

  def create
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.create(params[:id])
    
    
    respond_to do |format|
        format.html { redirect_to root_url, notice: 'Student was created updated.' }
    end
      
    
  end

  # PUT /students/1
  # PUT /students/1.json
  def update
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to teacher_student_path(@teacher), notice: 'Student was successfully updated.' }
        
      else
        format.html { render action: "edit" }
       
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @teacher = Teacher.find(params[:teacher_id])
    @student = @teacher.students.find(params[:id])
    @student.destroy
    redirect_to teacher_path(@teacher)
  end

  def import
    Student.import(params[:file])
    redirect_to "/allstudents/index", notice: "Students Imported"
  end

  def ayp
    @teacher = Teacher.find(params[:teacher_id])
    @students = @teacher.students.all
    if @teacher.departmental == true
      @ayp_math = Student.where("depart_class = ? AND met_math_ayp = ?", @teacher.depart_class, false).all :order => 'last_name ASC'
      @ayp_reading = Student.where("depart_class = ? AND met_reading_ayp = ?", @teacher.depart_class, false).all :order => 'last_name ASC'
    else
      @ayp_math = Student.where("teacher_id = ? AND met_math_ayp = ?", @teacher, false).all :order => 'last_name ASC'
      @ayp_reading = Student.where("teacher_id = ? AND met_reading_ayp = ?", @teacher, false).all :order => 'last_name ASC'
    end



  end

    def ayp_print
    @teacher = Teacher.find(params[:teacher_id])
    @students = @teacher.students.all
    if @teacher.departmental?
      @ayp_math = Student.where("depart_class = ? AND met_math_ayp = ?", @teacher.depart_class, false).all :order => 'last_name ASC'
      @ayp_reading = Student.where("depart_class = ? AND met_reading_ayp = ?", @teacher.depart_class, false).all :order => 'last_name ASC'
    else
      @ayp_math = Student.where("teacher_id = ? AND met_math_ayp = ?", @teacher, false).all :order => 'last_name ASC'
      @ayp_reading = Student.where("teacher_id = ? AND met_reading_ayp = ?", @teacher, false).all :order => 'last_name ASC'
    end
    render :layout => "print"


  end

  def bubble
    @teacher = Teacher.find(params[:teacher_id])
    @students = @teacher.students.all
    if @teacher.departmental?
      @bubble_math = Student.where("depart_class = ? AND bubble_math = ?", @teacher.depart_class, true).all :order => 'last_name ASC'
      @bubble_reading = Student.where("depart_class = ? AND bubble_reading = ?", @teacher.depart_class, true).all :order => 'last_name ASC'
    else
      @bubble_math = Student.where("teacher_id = ? AND bubble_math = ?", @teacher, true).all :order => 'last_name ASC'
      @bubble_reading = Student.where("teacher_id = ? AND bubble_reading = ?", @teacher, true).all :order => 'last_name ASC'
    end

  end   

    def bubble_print
    @teacher = Teacher.find(params[:teacher_id])
    @students = @teacher.students.all
    if @teacher.departmental?
      @bubble_math = Student.where("depart_class = ? AND bubble_math = ?", @teacher.depart_class, true).all :order => 'last_name ASC'
      @bubble_reading = Student.where("depart_class = ? AND bubble_reading = ?", @teacher.depart_class, true).all :order => 'last_name ASC'
    else
      @bubble_math = Student.where("teacher_id = ? AND bubble_math = ?", @teacher, true).all :order => 'last_name ASC'
      @bubble_reading = Student.where("teacher_id = ? AND bubble_reading = ?", @teacher, true).all :order => 'last_name ASC'
    end
    render :layout => "print"
  end  

  def search
    @students = Student.search(params[:search])
  end

  def print
    @teacher = Teacher.find(params[:teacher_id])
    @students = @teacher.students.all
    @ayp_math = Student.where("teacher_id = ? AND met_math_ayp = ?", @teacher, false)
    @ayp_reading = Student.where("teacher_id = ? AND met_reading_ayp = ?", @teacher, false)
    render :layout => "print"
  end

  def lesson_plans
    @teacher = Teacher.find(params[:teacher_id])
    @students = @teacher.students.all
    if @teacher.departmental?
      @bubble_math = Student.where("depart_class = ? AND bubble_math = ?", @teacher.depart_class, true).all :order => 'last_name ASC'
      @bubble_reading = Student.where("depart_class = ? AND bubble_reading = ?", @teacher.depart_class, true).all :order => 'last_name ASC'
    else
      @bubble_math = Student.where("teacher_id = ? AND bubble_math = ?", @teacher, true).all :order => 'last_name ASC'
      @bubble_reading = Student.where("teacher_id = ? AND bubble_reading = ?", @teacher, true).all :order => 'last_name ASC'
    end

  end   

end
