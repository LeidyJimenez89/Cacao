class AddOther2ToTranscriptions < ActiveRecord::Migration
  def change
    add_column :transcriptions, :registerdate, :string
  end
end
