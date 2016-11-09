class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.integer :basepay

      t.timestamps null: false
    end
  end
end
