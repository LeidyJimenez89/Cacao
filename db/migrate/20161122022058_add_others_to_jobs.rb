class AddOthersToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :flag, :integer
  end
end
