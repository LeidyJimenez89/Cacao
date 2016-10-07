class CreateJobSupervisors < ActiveRecord::Migration
  def change
    create_table :job_supervisors do |t|
      t.integer :job_id
      t.integer :supervisor_id

      t.timestamps null: false
    end
  end
end
