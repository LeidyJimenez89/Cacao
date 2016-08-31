class AddPonerjobIdToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :job_id, :integer
  end
end
