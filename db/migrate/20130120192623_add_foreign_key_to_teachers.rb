class AddForeignKeyToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :appraiser_id, :integer
  end
end
