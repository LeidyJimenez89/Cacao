class AddPonerdescriptionToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :description, :string
  end
end
