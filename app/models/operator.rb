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
			retirementdate=ultimaTranscripcion.registerdate
		elsif ultimo.state=="Activo"
			admissiondate= ultimo.dateadmission
			retirementdate=ultimaTranscripcion.registerdate
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

	def count950 (initdate, finaldate, person)
		ultimodia = finaldate
		ultimo = person.records.order("id desc").first
		ultimaTranscripcion= person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first

		if ultimo.state == "Retirado"
			retirementdate= ultimaTranscripcion.registerdate

			if person.records.where({state: "Reintegrado", :reinstatedate => initdate..finaldate}).first.present?
				admissiondate= ultimo.reinstatedate
			else
				admissiondate= person.dateadmission
			end

		elsif ultimo.state =="Reintegrado"
			admissiondate= ultimo.reinstatedate
			retirementdate=ultimaTranscripcion.registerdate
		elsif ultimo.state=="Activo"
			admissiondate= ultimo.dateadmission
			retirementdate=ultimaTranscripcion.registerdate
		end

		if initdate < admissiondate.to_date
			initdate=admissiondate.to_date
		end

		if finaldate > retirementdate.to_date
			finaldate=retirementdate.to_date
		end
		

		wageamount950 = person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first

		if wageamount950.labor_id == Labor.where(code: "950").first.id
			
			diferencia= (ultimodia.strftime("%d") - ultimaTranscripcion.strftime("%d"))

			finaldate= finaldate + (wageamount950.wageamount).days - 1.day
			if finaldate>ultimodia
				finaldate=ultimodia
				cantidad = diferencia
			end

		end
		return cantidad
	end

	def count960 (initdate, finaldate, person)

        licenciasRemuneradas = operator.transcriptions.where(labor_id: Labor.where(code: "950").first.id).where("registerdate > '" + params[:fromdate].to_s + "' AND registerdate < '" + params[:todate].to_s + " 23:59:59'").map { |e| e.laboramount }.reduce(0,:+).to_i
        licenciasNoRemuneradas = operator.transcriptions.where(labor_id: Labor.where(code: "960").first.id).where("registerdate > '" + params[:fromdate].to_s + "' AND registerdate < '" + params[:todate].to_s + " 23:59:59'").map { |e| e.laboramount }.reduce(0,:+).to_i
        licenciasAmbulatorias = operator.transcriptions.where(labor_id: Labor.where(code: "970").first.id).where("registerdate > '" + params[:fromdate].to_s + "' AND registerdate < '" + params[:todate].to_s + " 23:59:59'").map { |e| e.laboramount }.reduce(0,:+).to_i
        licenciasARL = operator.transcriptions.where(labor_id: Labor.where(code: "980").first.id).where("registerdate > '" + params[:fromdate].to_s + "' AND registerdate < '" + params[:todate].to_s + " 23:59:59'").map { |e| e.laboramount }.reduce(0,:+).to_i
        faltasInjustificadas = operator.transcriptions.where(labor_id: Labor.where(code: "990").first.id).where("registerdate > '" + params[:fromdate].to_s + "' AND registerdate < '" + params[:todate].to_s + " 23:59:59'").map { |e| e.laboramount }.reduce(0,:+).to_i
        licenciasSoat = operator.transcriptions.where(labor_id: Labor.where(code: "940").first.id).where("registerdate > '" + params[:fromdate].to_s + "' AND registerdate < '" + params[:todate].to_s + " 23:59:59'").map { |e| e.laboramount }.reduce(0,:+).to_i
        recargoNoctuno = operator.transcriptions.where(labor_id: Labor.where(code: "919").first.id).where("registerdate > '" + params[:fromdate].to_s + "' AND registerdate < '" + params[:todate].to_s + " 23:59:59'").map { |e| e.laboramount }.reduce(0,:+).to_i
        recargoFestivoDiurno = operator.transcriptions.where(labor_id: Labor.where(code: "920").first.id).where("registerdate > '" + params[:fromdate].to_s + "' AND registerdate < '" + params[:todate].to_s + " 23:59:59'").map { |e| e.laboramount }.reduce(0,:+).to_i
        recargoFestivoNocturno = operator.transcriptions.where(labor_id: Labor.where(code: "921").first.id).where("registerdate > '" + params[:fromdate].to_s + "' AND registerdate < '" + params[:todate].to_s + " 23:59:59'").map { |e| e.laboramount }.reduce(0,:+).to_i
        extraOrdinariaDiurna = operator.transcriptions.where(labor_id: Labor.where(code: "922").first.id).where("registerdate > '" + params[:fromdate].to_s + "' AND registerdate < '" + params[:todate].to_s + " 23:59:59'").map { |e| e.laboramount }.reduce(0,:+).to_i
        extraOrdinariaNocturna = operator.transcriptions.where(labor_id: Labor.where(code: "923").first.id).where("registerdate > '" + params[:fromdate].to_s + "' AND registerdate < '" + params[:todate].to_s + " 23:59:59'").map { |e| e.laboramount }.reduce(0,:+).to_i
        extraFestivaDiurna = operator.transcriptions.where(labor_id: Labor.where(code: "924").first.id).where("registerdate > '" + params[:fromdate].to_s + "' AND registerdate < '" + params[:todate].to_s + " 23:59:59'").map { |e| e.laboramount }.reduce(0,:+).to_i
        extraFestivaNocturna = operator.transcriptions.where(labor_id: Labor.where(code: "925").first.id).where("registerdate > '" + params[:fromdate].to_s + "' AND registerdate < '" + params[:todate].to_s + " 23:59:59'").map { |e| e.laboramount }.reduce(0,:+).to_i
	end

end
