class CreateTranscriptions < ActiveRecord::Migration
  def change
    create_table :transcriptions do |t|
      t.integer :supervisor_id
      t.integer :operator_id
      t.integer :job_id
      t.integer :labor_id
      t.integer :costc_id
      t.integer :sublot_id
      t.float :wageamount
      t.float :laboramount
      t.float :subtotal

      t.timestamps null: false
    end
  end
end
