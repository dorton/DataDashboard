class AddCampusToStudents < ActiveRecord::Migration
  def change
    add_column :students, :campus, :string
  end
end
