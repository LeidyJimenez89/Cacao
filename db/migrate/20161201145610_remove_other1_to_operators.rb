class RemoveOther1ToOperators < ActiveRecord::Migration
  def change
    remove_column :operators, :costcenter, :string
  end
end
