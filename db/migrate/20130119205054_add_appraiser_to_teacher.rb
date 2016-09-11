class AddAppraiserToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :appraiser, :string
    add_column :teachers, :appraiser_email, :string
  end
end
