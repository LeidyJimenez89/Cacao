class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.integer :vehicleAllowance
      t.integer :housingAllowance

      t.timestamps null: false
    end
  end
end
