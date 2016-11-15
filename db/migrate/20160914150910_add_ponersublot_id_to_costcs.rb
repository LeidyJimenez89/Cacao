class AddPonersublotIdToCostcs < ActiveRecord::Migration
  def change
    add_column :costcs, :sublot_id, :integer
  end
end
