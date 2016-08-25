class AddOperatorsToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :lastname, :string
    add_column :operators, :dateadmission, :datetime
  end
end
