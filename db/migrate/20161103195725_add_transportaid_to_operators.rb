class AddTransportaidToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :transportaid, :string
  end
end
