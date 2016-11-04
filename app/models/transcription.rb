class Transcription < ActiveRecord::Base
	belongs_to :operator
	belongs_to :supervisor
	belongs_to :costc
	belongs_to :labor
	belongs_to :sublot
	belongs_to :job
	attr_accessor :paymentunit2
end
