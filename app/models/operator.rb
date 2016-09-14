class Operator < ActiveRecord::Base
	belongs_to :job
	has_many :supervisors, through: :operator_supervisor
	has_many :operator_supervisor
end
