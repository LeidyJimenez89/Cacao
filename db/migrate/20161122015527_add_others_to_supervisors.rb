class AddOthersToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :vehicleAllowance, :integer
    add_column :supervisors, :housingAllowance, :integer
  end
end
