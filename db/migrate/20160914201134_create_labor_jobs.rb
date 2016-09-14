class CreateLaborJobs < ActiveRecord::Migration
  def change
    create_table :labor_jobs do |t|
      t.integer :labor_id
      t.integer :job_id

      t.timestamps null: false
    end
  end
end
