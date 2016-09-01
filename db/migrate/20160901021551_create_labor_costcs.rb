class CreateLaborCostcs < ActiveRecord::Migration
  def change
    create_table :labor_costcs do |t|
      t.integer :costc_id
      t.integer :labor_id

      t.timestamps null: false
    end
  end
end
