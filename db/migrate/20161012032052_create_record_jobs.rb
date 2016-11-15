class CreateRecordJobs < ActiveRecord::Migration
  def change
    create_table :record_jobs do |t|
      t.integer :operator_id
      t.string :description

      t.timestamps null: false
    end
  end
end
