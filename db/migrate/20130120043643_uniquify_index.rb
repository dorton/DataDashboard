class UniquifyIndex < ActiveRecord::Migration
  def change
        add_index :teachers, :email, :unique => true
  end
end
