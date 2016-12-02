class AddOther2ToNovelties < ActiveRecord::Migration
  def change
    add_column :novelties, :registerdate, :string
  end
end
