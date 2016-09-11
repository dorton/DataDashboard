class AddCampusToObservations < ActiveRecord::Migration
  def change
    add_column :observations, :campus, :string
  end
end
