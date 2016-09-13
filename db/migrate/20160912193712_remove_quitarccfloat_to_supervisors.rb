class RemoveQuitarccfloatToSupervisors < ActiveRecord::Migration
  def change
    remove_column :supervisors, :cc, :float
  end
end
