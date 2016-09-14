class LaborJob < ActiveRecord::Base
	belongs_to :job
	belongs_to :labor
end
