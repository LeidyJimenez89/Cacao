class RemovePonerjobsIdToOperators < ActiveRecord::Migration
  def change
    remove_column :operators, :jobs_id, :integer
  end
end
