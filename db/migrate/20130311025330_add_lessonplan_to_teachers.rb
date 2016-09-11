class AddLessonplanToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :lesson_plan, :string
  end
end
