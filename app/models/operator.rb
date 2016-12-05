class Operator < ActiveRecord::Base
	has_many :jobs, through: :job_operators
	has_many :job_operators

	has_many :supervisors, through: :operator_supervisor
	has_many :operator_supervisor

	has_many :records

	has_many :record_jobs

	has_many :transcriptions

	belongs_to :billingc

	belongs_to :company

	attr_accessor :records2
	attr_accessor :jobs2
	
	attr_accessor :fromdate
	attr_accessor :todate
	attr_accessor :companytype

	def asistance
		real = Hash.new
		laboresSinContarAsistencia = Labor.where(assistance: "No")
		self.transcriptions.where.not(labor_id: laboresSinContarAsistencia).each do |t|			
			real[t.registerdate] = 1
		end

		return real.length

	end

end
