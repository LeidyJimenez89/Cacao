class Sublot < ActiveRecord::Base
	belongs_to :costc

	has_many :transcriptions
end
