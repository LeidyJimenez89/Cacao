class AddPonergenderToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :gender, :string
  end
end
