class Operator < ActiveRecord::Base
	has_many :jobs, through: :job_operators
	has_many :job_operators

	has_many :supervisors, through: :operator_supervisor
	has_many :operator_supervisor

	has_many :records

	has_many :record_jobs

	has_many :transcriptions

	belongs_to :billingc

	attr_accessor :records2
	attr_accessor :jobs2

	def asistance
		real = Hash.new
		laboresSinContarAsistencia = [111111,111113,111114]
		self.transcriptions.where.not(labor_id: laboresSinContarAsistencia).each do |t|
			real[t.created_at] = 1
		end

		return real.length

	end

	def self.asiste
		return self.name
	end

end
