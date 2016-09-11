class Search < ActiveRecord::Base
  attr_accessible :keywords

	def students
	  @students ||= find_students
	end

private

	def find_students
	  students = Student.order(:last_name)
	  students = students.where("first_name like ? OR last_name like ? ", "%#{keywords}%", "%#{keywords}%" ) if keywords.present?
	end
end
