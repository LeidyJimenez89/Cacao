class AddBasepayToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :basepay, :integer
  end
end
