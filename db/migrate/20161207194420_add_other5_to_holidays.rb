class AddOther5ToHolidays < ActiveRecord::Migration
  def change
    add_column :holidays, :completedate, :string
  end
end
