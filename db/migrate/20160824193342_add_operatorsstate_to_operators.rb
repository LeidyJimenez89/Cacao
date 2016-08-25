class AddOperatorsstateToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :state, :string
  end
end
