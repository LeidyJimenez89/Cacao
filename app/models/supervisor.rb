class Supervisor < ActiveRecord::Base
	has_many :jobs, through: :job_supervisors
	has_many :job_supervisors

	has_many :operators, through: :operator_supervisor
	has_many :operator_supervisor

	has_many :records

	has_many :transcriptions

	has_many :novelties

	belongs_to :billingc

	belongs_to :company

	attr_accessor :operators2
	attr_accessor :jobs2

	def asistance
		real = Hash.new
		laboresSinContarAsistencia = Labor.where(assistance: "No")
		self.novelties.where.not(labor_id: laboresSinContarAsistencia).each do |t|
			real[t.registerdate] = 1
		end

		return real.length

	end
end
