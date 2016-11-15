class AddFechasToRecords < ActiveRecord::Migration
  def change
    add_column :records, :dateadmission, :datetime
    add_column :records, :retirementdate, :datetime
  end
end
