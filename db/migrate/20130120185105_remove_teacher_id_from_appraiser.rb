class RemoveTeacherIdFromAppraiser < ActiveRecord::Migration
  def up
    remove_column :appraisers, :teacher_id
  end

  def down
    add_column :appraisers, :teacher_id, :integer
  end
end
