class RemoveData2ToConfigs < ActiveRecord::Migration
  def change
    remove_column :configs, :name, :string
    remove_column :configs, :value, :integer
  end
end
