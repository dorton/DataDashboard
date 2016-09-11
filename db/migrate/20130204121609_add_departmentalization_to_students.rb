class AddDepartmentalizationToStudents < ActiveRecord::Migration
  def change
    add_column :students, :depart_class, :string
  end
end
