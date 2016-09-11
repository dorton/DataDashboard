class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :last_name
      t.string :first_name
      t.string :grade

      t.timestamps
    end
  end
end
