class AddOtherToLabors < ActiveRecord::Migration
  def change
    add_column :labors, :assistance, :string
  end
end
