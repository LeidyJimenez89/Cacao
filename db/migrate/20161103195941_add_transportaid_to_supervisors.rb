class AddTransportaidToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :transportaid, :string
  end
end
