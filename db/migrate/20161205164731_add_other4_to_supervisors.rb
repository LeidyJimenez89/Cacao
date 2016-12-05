class AddOther4ToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :company_id, :integer
  end
end
