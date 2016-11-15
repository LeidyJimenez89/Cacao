class AddPonerjobsIdToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :jobs_id, :integer
  end
end
