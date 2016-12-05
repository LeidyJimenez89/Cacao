class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :nit
      t.string :name
      t.integer :phone
      t.string :address
      t.string :description

      t.timestamps null: false
    end
  end
end
