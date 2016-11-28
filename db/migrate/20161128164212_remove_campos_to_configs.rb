class RemoveCamposToConfigs < ActiveRecord::Migration
  def change
    remove_column :configs, :transportAllowance, :integer
    remove_column :configs, :basepay, :integer
  end
end
