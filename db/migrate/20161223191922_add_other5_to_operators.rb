class AddOther5ToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :liquidated, :string
  end
end
