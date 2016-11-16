class AddDate2ToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :registerDate, :dateTime
  end
end
