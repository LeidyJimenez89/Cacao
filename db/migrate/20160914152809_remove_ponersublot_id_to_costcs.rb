class RemovePonersublotIdToCostcs < ActiveRecord::Migration
  def change
    remove_column :costcs, :sublot_id, :integer
  end
end
