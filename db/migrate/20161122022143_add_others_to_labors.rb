class AddOthersToLabors < ActiveRecord::Migration
  def change
    add_column :labors, :flag, :integer
  end
end
