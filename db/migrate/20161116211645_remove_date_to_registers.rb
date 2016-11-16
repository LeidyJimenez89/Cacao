class RemoveDateToRegisters < ActiveRecord::Migration
  def change
    remove_column :registers, :date, :dateTime
  end
end
