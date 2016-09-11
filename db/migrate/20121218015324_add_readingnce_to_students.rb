class AddReadingnceToStudents < ActiveRecord::Migration
  def change
    add_column :students, :reading_nce, :string
  end
end
