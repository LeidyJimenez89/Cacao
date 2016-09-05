class AddPonerjobIdToSupervisors < ActiveRecord::Migration
  def change
    add_column :supervisors, :job_id, :integer
  end
end
