class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.integer :record_id
      t.integer :operator_id
      t.string :state
      t.string :description

      t.timestamps null: false
    end
  end
end
