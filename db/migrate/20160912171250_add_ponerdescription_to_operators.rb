class AddPonerdescriptionToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :description, :string
  end
end
