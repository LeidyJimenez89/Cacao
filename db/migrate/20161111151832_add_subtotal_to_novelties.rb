class AddSubtotalToNovelties < ActiveRecord::Migration
  def change
    add_column :novelties, :subtotal, :float
  end
end
