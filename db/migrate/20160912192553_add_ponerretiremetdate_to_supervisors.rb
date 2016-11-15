class AddPonerretiremetdateToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :retirementdate, :datetime
  end
end
