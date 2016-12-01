class CreateHolidays < ActiveRecord::Migration
  def change
    create_table :holidays do |t|
      t.integer :numberday
      t.integer :numbermonth

      t.timestamps null: false
    end
  end
end
