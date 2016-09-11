class CreateObservations < ActiveRecord::Migration
  def change
    create_table :observations do |t|
      t.string :on_task
      t.string :observer
      t.references :student

      t.timestamps
    end
    add_index :observations, :student_id
  end
end
