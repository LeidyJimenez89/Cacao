class AddOther3ToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :billingc_id, :integer
  end
end
