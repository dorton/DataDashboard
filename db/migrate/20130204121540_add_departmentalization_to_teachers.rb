class AddDepartmentalizationToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :departmental, :boolean
    add_column :teachers, :depart_class, :string
  end
end
