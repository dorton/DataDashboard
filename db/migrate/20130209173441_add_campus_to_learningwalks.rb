class AddCampusToLearningwalks < ActiveRecord::Migration
  def change
    add_column :learningwalks, :campus, :string
  end
end
