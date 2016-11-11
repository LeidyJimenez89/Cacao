class AddAreaToTranscriptions < ActiveRecord::Migration
  def change
    add_column :transcriptions, :area, :string
  end
end
