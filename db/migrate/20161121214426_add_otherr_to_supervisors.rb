class AddOtherrToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :feedingAllowance, :integer
    add_column :supervisors, :feedingAllowancen, :integer
    add_column :supervisors, :sanction, :integer
    add_column :supervisors, :childrenLicenseSince, :dateTime
    add_column :supervisors, :childrenLicenseUntil, :dateTime
    add_column :supervisors, :transportAllowance, :string
    add_column :supervisors, :flag, :integer
  end
end
