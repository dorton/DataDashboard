class CreateLessonplans < ActiveRecord::Migration
  def change
    create_table :lessonplans do |t|
      t.string :lesson_plan
      t.string :name
      t.string :campus

      t.timestamps
    end
  end
end
