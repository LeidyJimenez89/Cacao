class AddOther5ToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :liquidated, :string
  end
end
