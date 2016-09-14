class AddPonercostcIdToSublots < ActiveRecord::Migration
  def change
    add_column :sublots, :costc_id, :integer
  end
end
