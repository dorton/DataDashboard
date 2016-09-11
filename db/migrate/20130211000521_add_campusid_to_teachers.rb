class AddCampusidToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :campus_id, :integer
  end
end
