class Novelty < ActiveRecord::Base
	belongs_to :labor
	belongs_to :job
	belongs_to :supervisor
end
