class RemoveQuitarToSupervisors < ActiveRecord::Migration
  def change
    remove_column :supervisors, :position, :string
  end
end
