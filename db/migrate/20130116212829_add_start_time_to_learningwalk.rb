class AddStartTimeToLearningwalk < ActiveRecord::Migration
  def change
    add_column :learningwalks, :start_time, :datetime
  end
end
