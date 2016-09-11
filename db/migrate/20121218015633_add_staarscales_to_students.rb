class AddStaarscalesToStudents < ActiveRecord::Migration
  def change
    add_column :students, :reading_staar_scale, :string
    add_column :students, :math_staar_scale, :string
  end
end
