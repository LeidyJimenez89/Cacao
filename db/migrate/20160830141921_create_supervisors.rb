class CreateSupervisors < ActiveRecord::Migration
  def change
    create_table :supervisors do |t|
      t.integer :user_id
      t.string :name
      t.string :lastname
      t.float :cc
      t.string :state
      t.string :position
      t.datetime :dateadmission

      t.timestamps null: false
    end
  end
end
