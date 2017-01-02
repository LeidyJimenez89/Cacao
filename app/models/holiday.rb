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

	def self.effectydays (initdate, finaldate, paydate, person)
		ultimodia = finaldate
		ultimo = person.records.order("id desc").first
		ultimaTranscripcion= person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first


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

		if admissiondate.to_date<=finaldate
			if initdate <= admissiondate.to_date
				initdate=admissiondate.to_date
			end

			if finaldate >= retirementdate.to_date
				finaldate=retirementdate.to_date
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

	def self.paydays (initdate, finaldate, paydate, person)
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

			retirementdate= ultimo.retirementdate

			if person.records.where({state: "Reintegrado", :reinstatedate => initdate..finaldate}).first.present?
				admissiondate= ultimo.reinstatedate
			else
				admissiondate= person.dateadmission
			end

		elsif ultimo.state =="Reintegrado"
			admissiondate= ultimo.reinstatedate
			retirementdate=ultimaTranscripcion.present? ? ultimaTranscripcion.registerdate : initdate - 1.day
		elsif ultimo.state=="Activo"
			admissiondate= ultimo.dateadmission
			retirementdate=ultimaTranscripcion.present? ? ultimaTranscripcion.registerdate : initdate -1.day
			retirementdate=ultimaTranscripcion.present? ? ultimaTranscripcion.registerdate : finaldate
		elsif ultimo.state=="Activo"
			admissiondate= ultimo.dateadmission
			retirementdate=ultimaTranscripcion.present? ? ultimaTranscripcion.registerdate : finaldate
		end

		if admissiondate.to_date<=finaldate
			if initdate <= admissiondate.to_date
				initdate=admissiondate.to_date
			end

			if finaldate >= retirementdate.to_date
				finaldate=retirementdate.to_date
			end

			diasFestivos = Holiday.where(:completedate => initdate..finaldate).map { |e| e.completedate }
			diaPago = paydate.strftime("%Y-%m-%d")
			cont = 0




			mensualidad   = Hash.new
			diasFaltantes = Array.new

			(initdate..finaldate).each do |day|
				#licencia         = person.licencias(day, []) == 0 ? true : false
				laboresLicencias = Labor.where(code: [940,950,960,970,980,990]).map { |e| e.id }
				trancripcionDia  = person.transcriptions.where(registerdate: day).where.not(labor_id: laboresLicencias).present?
				domingo          = day.strftime("%A") == "Sunday" ? true : false
				diaPaga          = day.strftime("%Y-%m-%d") == diaPago ? true : false
				festivo          = diasFestivos.include?(day.strftime("%Y-%m-%d"))

				if domingo
					mensualidad[day] = 1
				elsif diaPaga
					mensualidad[day] = 1
				elsif festivo
					mensualidad[day] = 1
				elsif trancripcionDia
					mensualidad[day] = 1
				else
					diasFaltantes.push(day.strftime("%Y-%m-%d"))
				end
			end

			cont = mensualidad.length
			if cont==31
				cont = cont -1
			end

	      	return {cont: cont, diasFaltantes: diasFaltantes}

		else
			return {cont: 0, diasFaltantes: []}

			(initdate..finaldate).each do |t|
				mensualidad [t.strftime("%Y-%m-%d")] = person.licencias(t, [])
			end

			mensualidad.each do |day|
				if day[1]==1
					if person.transcriptions.where(registerdate: day[0].to_date).present?

						mensualidad[day[0]]=1

					elsif day[0].to_date.strftime("%A")== "Sunday" 
						mensualidad[day[0]]=1


					elsif day[0].to_date.strftime("%Y-%m-%d")== diaPago

						mensualidad[day[0]]=1

					elsif diasFestivos.include?(day[0].to_date.strftime("%Y-%m-%d")) and day[0].to_date.strftime("%Y-%m-%d")!= "Sunday"
						
						mensualidad[day[0]]=1

					else

						mensualidad[day[0]]=0

					end
				end
			end

			mensualidad.each do |pay|
				if pay[1]==1
					cont=cont+1
				end
			end
			if cont==31
				return cont -1
			else
				return cont
			end
			
		else
			return 0
		end
	end
end
