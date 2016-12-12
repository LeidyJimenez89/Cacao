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
		
		record = person.records.order("id desc").first

		if record.state=="Retirado"
			if person.records.where(state: "Reintegrado").order("id desc").first.present?
				admissiondate = person.records.where(state: "Reintegrado").order("id desc").first.reinstatedate
			else
				admissiondate = person[:admissiondate]
			end
		elsif record.state=="Reintegrado"
			if person.records.where(state: "Reintegrado").order("id desc").first.present?
				admissiondate = person.records.where(state: "Reintegrado").order("id desc").first.reinstatedate
			else
				admissiondate = person[:admissiondate]
			end
		else
			admissiondate = person[:admissiondate]
		end

		if person.records.where(state: "Retirado").order("id desc").first.present?
			retirementdate = person.records.where(state: "Retirado").order("id desc").first.retirementdate
		end

		log(admissiondate)
		log(retirementdate)

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

end
