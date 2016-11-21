class AddOtherToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :feedingAllowance, :integer
    add_column :operators, :feedingAllowancen, :integer
    add_column :operators, :sanction, :integer
    add_column :operators, :childrenLicenseSince, :dateTime
    add_column :operators, :childrenLicenseUntil, :dateTime
    add_column :operators, :transportAllowance, :string
    add_column :operators, :flag, :integer
  end
end
