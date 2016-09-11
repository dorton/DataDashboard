class CreateLearningwalks < ActiveRecord::Migration
  def change
    create_table :learningwalks do |t|
      t.string :observer
      t.string :subject
      t.string :highlights
      t.string :growths
      t.references :teacher

      t.timestamps
    end
    add_index :learningwalks, :teacher_id
  end
end
