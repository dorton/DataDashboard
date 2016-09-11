class CreateAppraisers < ActiveRecord::Migration
  def change
    create_table :appraisers do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.references :teacher

      t.timestamps
    end
  end
end
