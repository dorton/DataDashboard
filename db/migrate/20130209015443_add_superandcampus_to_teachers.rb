class AddSuperandcampusToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :superuser, :boolean
    add_column :teachers, :campus, :string
  end
end
