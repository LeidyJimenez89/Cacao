class AddOthersToSublots < ActiveRecord::Migration
  def change
    add_column :sublots, :flag, :integer
  end
end
