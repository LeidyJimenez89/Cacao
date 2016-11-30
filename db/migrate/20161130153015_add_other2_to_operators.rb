class AddOther2ToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :basepay, :integer
  end
end
