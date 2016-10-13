class AddDateToRecordJobs < ActiveRecord::Migration
  def change
    add_column :record_jobs, :changejobdate, :DateTime
  end
end
