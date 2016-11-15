class CreateNovelties < ActiveRecord::Migration
  def change
    create_table :novelties do |t|
      t.integer :supervisor_id
      t.integer :job_id
      t.integer :labor_id
      t.string :area
      t.float :wageamount
      t.float :laboramount

      t.timestamps null: false
    end
  end
end
