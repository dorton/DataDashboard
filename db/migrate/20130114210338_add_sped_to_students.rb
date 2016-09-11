class AddSpedToStudents < ActiveRecord::Migration
  def change
    add_column :students, :sped, :boolean
  end
end
