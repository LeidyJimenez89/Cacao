class AddDataToConfigs < ActiveRecord::Migration
  def change
    add_column :configs, :name, :string
    add_column :configs, :value, :integer
  end
end
