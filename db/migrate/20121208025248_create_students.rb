class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :last_name
      t.string :first_name
      t.string :stu_id
      t.boolean :met_math_ayp, :default => true
      t.boolean :met_reading_ayp, :default => true
      t.boolean :bubble_math, :default => false
      t.boolean :bubble_reading, :default => false
      t.references :teacher

      t.timestamps
    end
    add_index :students, :teacher_id
  end
end
