class AddNotesToObservations < ActiveRecord::Migration
  def change
    add_column :observations, :notes, :string
    add_column :observations, :off_task, :boolean
  end
end
