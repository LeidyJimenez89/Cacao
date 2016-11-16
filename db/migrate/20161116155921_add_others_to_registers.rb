class AddOthersToRegisters < ActiveRecord::Migration
  def change
    add_column :registers, :feedingAllowance, :integer
    add_column :registers, :feedingAllowancen, :integer
    add_column :registers, :sanction, :integer
    add_column :registers, :childrenLicenseSince, :dateTime
    add_column :registers, :childrenLicenseUntil, :dateTime
    add_column :registers, :extraLegalAllowance, :integer
    add_column :registers, :salesCommision, :integer
    add_column :registers, :customerDiscount, :integer
    add_column :registers, :transportAllowance, :integer
  end
end
