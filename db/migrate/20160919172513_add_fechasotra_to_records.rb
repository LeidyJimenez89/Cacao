class AddFechasotraToRecords < ActiveRecord::Migration
  def change
    add_column :records, :reinstatedate, :datetime
  end
end
