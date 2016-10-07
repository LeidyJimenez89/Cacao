class CreateJobEmployees < ActiveRecord::Migration
  def change
    create_table :job_employees do |t|
      t.integer :job_id
      t.integer :operator_id
      t.integer :supervisor_id
      t.string :type

      t.timestamps null: false
    end
  end
end
