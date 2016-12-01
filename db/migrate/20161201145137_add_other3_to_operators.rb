class AddOther3ToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :billingc_id, :integer
  end
end
