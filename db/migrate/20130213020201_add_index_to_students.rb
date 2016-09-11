class AddIndexToStudents < ActiveRecord::Migration
  def change
    add_index :students, :teacher_id, :name=>'student_index'
  end
end
