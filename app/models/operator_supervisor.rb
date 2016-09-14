class OperatorSupervisor < ActiveRecord::Base
	belongs_to :operator
	belongs_to :supervisor
end
