class AddPonergenderToOperators < ActiveRecord::Migration
  def change
    add_column :operators, :gender, :string
  end
end
