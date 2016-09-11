class AddCatToStudents < ActiveRecord::Migration
  def change
    add_column :students, :elar_cat_1, :string
    add_column :students, :elar_cat_2, :string
    add_column :students, :elar_cat_3, :string
    add_column :students, :math_cat_1, :string
    add_column :students, :math_cat_2, :string
    add_column :students, :math_cat_3, :string
    add_column :students, :math_cat_4, :string
    add_column :students, :math_cat_5, :string
    add_column :students, :science_cat_1, :string
    add_column :students, :science_cat_2, :string
    add_column :students, :science_cat_3, :string
    add_column :students, :science_cat_4, :string
    add_column :students, :writing_cat_1, :string
    add_column :students, :writing_cat_2, :string
    add_column :students, :writing_cat_3, :string
    add_column :students, :science_staar_scale, :string
    add_column :students, :writing_staar_scale, :string
  end
end
