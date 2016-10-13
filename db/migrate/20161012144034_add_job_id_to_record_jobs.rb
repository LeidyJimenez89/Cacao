class AddJobIdToRecordJobs < ActiveRecord::Migration
  def change
    add_column :record_jobs, :job_id, :integer
  end
end
