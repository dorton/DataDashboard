class AddIndexToTeacher < ActiveRecord::Migration
  def change
        add_index :teachers, :appraiser_id
  end
end
