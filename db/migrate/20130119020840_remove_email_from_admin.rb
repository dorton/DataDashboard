class RemoveEmailFromAdmin < ActiveRecord::Migration
  def up
    remove_column :admins, :email
  end

  def down
    add_column :admins, :email, :string
  end
end
