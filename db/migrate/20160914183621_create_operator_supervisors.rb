class CreateOperatorSupervisors < ActiveRecord::Migration
  def change
    create_table :operator_supervisors do |t|
      t.integer :supervisor_id
      t.integer :operator_id

      t.timestamps null: false
    end
  end
end
