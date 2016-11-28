class AddOther1ToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :costcenter, :string
  end
end
