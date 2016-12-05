class AddOther4ToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :company_id, :integer
  end
end
