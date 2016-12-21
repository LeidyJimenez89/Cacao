class Holiday < ActiveRecord::Base

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

	def self.effectydays (initdate, finaldate, paydate, person, licenciasRemuneradas, licenciasNoRemuneradas, licenciasAmbulatorias, licenciasARL, faltasInjustificadas, licenciasSoat)
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

		if admissiondate.to_date<=finaldate
			if initdate <= admissiondate.to_date
				initdate=admissiondate.to_date
			end

			if finaldate >= retirementdate.to_date
				finaldate=retirementdate.to_date
			end

			wageamount950 = person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first
			wageamount960 = person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first
			wageamount970 = person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first
			wageamount980 = person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first
			wageamount990 = person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first

			if wageamount950.labor_id == Labor.where(code: "950").first.id
				finaldate= finaldate + (wageamount950.wageamount).days - 1.day

			elsif wageamount960.labor_id == Labor.where(code: "960").first.id
				finaldate= finaldate + (wageamount960.wageamount).days - 1.day

			elsif wageamount970.labor_id == Labor.where(code: "970").first.id
				finaldate= finaldate + (wageamount970.wageamount).days - 1.day

			elsif wageamount980.labor_id == Labor.where(code: "980").first.id
				finaldate= finaldate + (wageamount980.wageamount).days - 1.day

			elsif wageamount990.labor_id == Labor.where(code: "990").first.id
				finaldate= finaldate + (wageamount990.wageamount).days - 1.day
			end

			if finaldate>=ultimodia
				finaldate=ultimodia
			end

			diasFestivos = Holiday.where(:completedate => initdate..finaldate).map { |e| e.completedate }
			diaPago = paydate.strftime("%Y-%m-%d")

			cont=0

			(initdate..finaldate).each do |day|
			  if day.strftime("%A") != "Sunday" and !diasFestivos.include?(day.strftime("%Y-%m-%d")) and day.strftime("%Y-%m-%d")!=diaPago
			  	cont = cont+1
			  end
			end

			return cont
		else
			return 0
		end
	end

	def self.paydays1 (initdate, finaldate, paydate, person, licenciasRemuneradas, licenciasNoRemuneradas, licenciasAmbulatorias, licenciasARL, faltasInjustificadas, licenciasSoat)
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

		if admissiondate.to_date<=finaldate
			if initdate <= admissiondate.to_date
				initdate=admissiondate.to_date
			end

			if finaldate >= retirementdate.to_date
				finaldate=retirementdate.to_date
			end

			wageamount950 = person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first
			wageamount960 = person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first
			wageamount970 = person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first
			wageamount980 = person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first
			wageamount990 = person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first

			if wageamount950.labor_id == Labor.where(code: "950").first.id
				finaldate= finaldate + (wageamount950.wageamount).days - 1.day

			elsif wageamount960.labor_id == Labor.where(code: "960").first.id
				finaldate= finaldate + (wageamount960.wageamount).days - 1.day

			elsif wageamount970.labor_id == Labor.where(code: "970").first.id
				finaldate= finaldate + (wageamount970.wageamount).days - 1.day

			elsif wageamount980.labor_id == Labor.where(code: "980").first.id
				finaldate= finaldate + (wageamount980.wageamount).days - 1.day

			elsif wageamount990.labor_id == Labor.where(code: "990").first.id
				finaldate= finaldate + (wageamount990.wageamount).days - 1.day
			end

			if finaldate>=ultimodia
				finaldate=ultimodia
			end

			diasFestivos = Holiday.where(:completedate => initdate..finaldate).map { |e| e.completedate }
			diaPago = paydate.strftime("%Y-%m-%d")

			cont=0

			(initdate..finaldate).each do |day|
			  	if diasFestivos.include?(day.strftime("%Y-%m-%d"))
				  	if day.strftime("%A") == "Sunday"
				  		cont = cont+1
				  	end
				else
				  	cont = cont+1
			  	end
		  	end

			if ultimaTranscripcion.registerdate.to_date.strftime("%d") == 31
				return cont -1 - licenciasRemuneradas - licenciasNoRemuneradas - licenciasAmbulatorias -licenciasARL - faltasInjustificadas - licenciasSoat
			else
				return cont - licenciasRemuneradas - licenciasNoRemuneradas - licenciasAmbulatorias -licenciasARL - faltasInjustificadas - licenciasSoat
			end

		else
			return 0
		end
	end

	def self.paydays (initdate, finaldate, paydate, person, licenciasRemuneradas, licenciasNoRemuneradas, licenciasAmbulatorias, licenciasARL, faltasInjustificadas, licenciasSoat)
		mensualidad = Hash.new
		ultimaTranscripcion= person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first

		ultimo = person.records.order("id desc").first

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

		if admissiondate.to_date<=finaldate
			if initdate <= admissiondate.to_date
				initdate=admissiondate.to_date
			end

			if finaldate >= retirementdate.to_date
				finaldate=retirementdate.to_date
			end

			diasFestivos = Holiday.where(:completedate => initdate..finaldate).map { |e| e.completedate }

			diasDomingos=0
			diaPago = paydate.strftime("%Y-%m-%d")
			diasPago = 0











			(initdate..finaldate).each do |t|	

				mensualidad [t.strftime("%Y-%m-%d")] = person.licencias(t)

			end






Holiday.log(mensualidad)

			return mensualidad.length
		else
			return 0
		end
	end
end
