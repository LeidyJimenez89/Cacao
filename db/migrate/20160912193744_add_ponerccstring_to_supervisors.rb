class AddPonerccstringToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :cc, :string
  end
end
