class CreateSublots < ActiveRecord::Migration
  def change
    create_table :sublots do |t|
      t.string :code
      t.string :name
      t.integer :user_id
      t.string :description

      t.timestamps null: false
    end
  end
end
