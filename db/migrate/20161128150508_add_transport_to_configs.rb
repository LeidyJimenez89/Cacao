class AddTransportToConfigs < ActiveRecord::Migration
  def change
    add_column :configs, :transportAllowance, :integer
  end
end
