class AddOther1ToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :costcenter, :string
  end
end
