class AddOthersToConfigs < ActiveRecord::Migration
  def change
    add_column :configs, :flag, :integer
  end
end
