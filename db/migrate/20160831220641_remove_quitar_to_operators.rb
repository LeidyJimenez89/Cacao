class RemoveQuitarToOperators < ActiveRecord::Migration
  def change
    remove_column :operators, :position, :string
  end
end
