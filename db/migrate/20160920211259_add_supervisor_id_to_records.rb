class AddSupervisorIdToRecords < ActiveRecord::Migration
  def change
    add_column :records, :supervisor_id, :integer
  end
end
