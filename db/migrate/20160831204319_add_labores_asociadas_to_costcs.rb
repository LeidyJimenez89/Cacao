class AddLaboresAsociadasToCostcs < ActiveRecord::Migration
  def change
    add_column :costcs, :labors, :string
  end
end
