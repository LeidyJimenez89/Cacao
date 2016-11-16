class AddDateToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :date, :dateTime
  end
end
