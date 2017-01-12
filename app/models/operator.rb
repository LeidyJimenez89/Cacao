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




	def asistance (initdate, finaldate, person)

		real = Hash.new
		laboresSinContarAsistencia = Labor.where(assistance: "No")
		ultimaTranscripcion= person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first

		ultimo = person.records.order("id desc").first

		if ultimo.state == "Retirado"

			retirementdate= ultimo.retirementdate

			if person.records.where({state: "Reintegrado", :reinstatedate => initdate..finaldate}).first.present?
				admissiondate= ultimo.reinstatedate
			else
				admissiondate= person.dateadmission
			end

		elsif ultimo.state =="Reintegrado"
			admissiondate= ultimo.reinstatedate
			retirementdate=ultimaTranscripcion.present? ? ultimaTranscripcion.registerdate : finaldate
		elsif ultimo.state=="Activo"
			admissiondate= ultimo.dateadmission
			retirementdate=ultimaTranscripcion.present? ? ultimaTranscripcion.registerdate : finaldate
		end

		if initdate < admissiondate.to_date
			initdate=admissiondate.to_date
		end

		if finaldate > retirementdate.to_date
			finaldate=retirementdate.to_date
		end

		self.transcriptions.where(registerdate: initdate..finaldate).where.not(labor_id: laboresSinContarAsistencia).each do |t|			
			real[t.registerdate] = 1
		end

		return real.length

	end




	def licencias (dayToCheck , conditions)
		flag = 1

		day = dayToCheck.to_date
		laboresSinContarAsistencia = Labor.where(assistance: "No").where(conditions).map { |e| e.id }

		registers = self.transcriptions.where(labor_id: laboresSinContarAsistencia)

		registers.each do |register|
			range = register.registerdate.to_date..register.registerdate.to_date + (register.laboramount).days - 1.day
			if range.include?(day) and flag == 1
				flag = 0
			end
		end

		return flag
	end 




end
