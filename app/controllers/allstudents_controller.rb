class AllstudentsController < ApplicationController
  
  def index

  	respond_to do |format|
      format.html
      format.csv { render text: Teacher.all.to_csv }
    end

    @students = Student.search(params[:search])
  end
end
