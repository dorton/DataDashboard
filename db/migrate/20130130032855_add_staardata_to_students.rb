class AddStaardataToStudents < ActiveRecord::Migration
  def change
    add_column :students, :met_reading_standard, :boolean
    add_column :students, :reading_test_version, :string
    add_column :students, :met_math_standard, :boolean
    add_column :students, :math_test_version, :string
  end
end
