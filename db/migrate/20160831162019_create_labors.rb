class CreateLabors < ActiveRecord::Migration
  def change
    create_table :labors do |t|
      t.integer :user_id
      t.string :code
      t.string :name
      t.string :paymentunit
      t.float :rate

      t.timestamps null: false
    end
  end
end
