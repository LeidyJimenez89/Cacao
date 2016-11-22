class AddOthersToCostc < ActiveRecord::Migration
  def change
    add_column :costcs, :flag, :integer
  end
end
