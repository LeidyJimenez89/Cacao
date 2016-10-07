class JobSupervisor < ActiveRecord::Base
	belongs_to :supervisor
	belongs_to :job
end
