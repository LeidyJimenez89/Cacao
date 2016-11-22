class AddOthersToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :vehicleAllowance, :integer
    add_column :operators, :housingAllowance, :integer
  end
end
