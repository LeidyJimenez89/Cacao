class AddOther2ToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :basepay, :integer
  end
end
