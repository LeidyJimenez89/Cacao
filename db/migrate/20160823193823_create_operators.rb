class CreateOperators < ActiveRecord::Migration
  def change
    create_table :operators do |t|
      t.string :cc
      t.string :name
      t.string :position

      t.timestamps null: false
    end
  end
end
