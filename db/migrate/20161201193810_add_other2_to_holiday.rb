class AddOther2ToHoliday < ActiveRecord::Migration
  def change
    add_column :holidays, :numberyear, :integer
  end
end
