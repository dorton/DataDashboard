class RemoveAppraiserFromTeacher < ActiveRecord::Migration
  def up
    remove_column :teachers, :appraiser
    remove_column :teachers, :appraiser_email
  end

  def down
    add_column :teachers, :appraiser_email, :string
    add_column :teachers, :appraiser, :string
  end
end
