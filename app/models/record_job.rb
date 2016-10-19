class RecordJob < ActiveRecord::Base
	belongs_to :operator
	belongs_to :job
end
