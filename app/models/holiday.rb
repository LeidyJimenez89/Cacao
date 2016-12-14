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
		ultimo = person.records.order("id desc").first
		ultimaTranscripcion= person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first

		if ultimo.state == "Retirado"
			retirementdate= ultimo.retirementdate
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

		diasFestivos = Holiday.where(:completedate => initdate..finaldate).map { |e| e.completedate }
		diaPago = paydate.strftime("%Y-%m-%d")

		cont=0

		(initdate..finaldate).each do |day|
		  if day.strftime("%A") != "Sunday" and !diasFestivos.include?(day.strftime("%Y-%m-%d")) and day.strftime("%Y-%m-%d")!=diaPago
		  	cont = cont+1
		  end
		end

		return cont
	end

	def self.paydays (initdate, finaldate, paydate, person)
		ultimo = person.records.order("id desc").first
		ultimaTranscripcion= person.transcriptions.where(:registerdate => initdate..finaldate).order("registerdate desc").first

		if ultimo.state == "Retirado"
			retirementdate= ultimo.retirementdate
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
			return cont -1
		else
			return cont
		end
	end
end
