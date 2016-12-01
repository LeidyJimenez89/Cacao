class RemoveOther1ToSupervisors < ActiveRecord::Migration
  def change
    remove_column :supervisors, :costcenter, :string
  end
end
