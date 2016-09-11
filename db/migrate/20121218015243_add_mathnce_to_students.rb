class AddMathnceToStudents < ActiveRecord::Migration
  def change
    add_column :students, :math_nce, :string
  end
end
