class CreateCostcs < ActiveRecord::Migration
  def change
    create_table :costcs do |t|
      t.integer :user_id
      t.string :code
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
