class AddPonerretirementdateToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :retirementdate, :datetime
  end
end
