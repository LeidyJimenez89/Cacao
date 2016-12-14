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
	attr_accessor :paydate




	def self.log(var)
		time = Time.new
		values = time.to_s

		data = pp var.inspect.encode "UTF-8"
		path = "public/errorlog.txt"
		File.open(path, "a+") do |f|
		  f.write("*****************************************"+values+"*****************************************\n")
		  f.write("** "+data)
		  f.write("\n***********************************************************************************************************\n\n")
		end
	end




	def asistance (fromdate, todate)
		real = Hash.new
		laboresSinContarAsistencia = Labor.where(assistance: "No")
		Operator.log(self.transcriptions.where(registerdate: fromdate..todate).where.not(labor_id: laboresSinContarAsistencia).to_sql)
		self.transcriptions.where(registerdate: fromdate..todate).where.not(labor_id: laboresSinContarAsistencia).each do |t|			
			real[t.registerdate] = 1
		end
			Operator.log(real)

		return real.length

	end

end
