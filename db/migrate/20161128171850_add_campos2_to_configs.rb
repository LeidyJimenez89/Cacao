class AddCampos2ToConfigs < ActiveRecord::Migration
  def change
    add_column :configs, :transportAllowance, :integer
    add_column :configs, :basepay, :integer
  end
end
