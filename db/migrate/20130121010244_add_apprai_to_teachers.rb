class AddAppraiToTeachers < ActiveRecord::Migration
  def change
    add_column :teachers, :apprai, :string
    add_column :teachers, :apprai_email, :string
  end
end
