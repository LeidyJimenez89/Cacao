class Operator < ActiveRecord::Base
	has_many :jobs, through: :job_operators
	has_many :job_operators

	has_many :supervisors, through: :operator_supervisor
	has_many :operator_supervisor

	has_many :records

	attr_accessor :records2
	attr_accessor :jobs2
end
