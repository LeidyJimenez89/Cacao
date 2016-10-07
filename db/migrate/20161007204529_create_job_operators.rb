class CreateJobOperators < ActiveRecord::Migration
  def change
    create_table :job_operators do |t|
      t.integer :job_id
      t.integer :operator_id

      t.timestamps null: false
    end
  end
end
