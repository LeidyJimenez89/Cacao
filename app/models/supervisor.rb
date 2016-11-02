class Supervisor < ActiveRecord::Base
	has_many :jobs, through: :job_supervisors
	has_many :job_supervisors

	has_many :operators, through: :operator_supervisor
	has_many :operator_supervisor

	has_many :records

	has_many :transcriptions

	attr_accessor :operators2
	attr_accessor :jobs2
end
