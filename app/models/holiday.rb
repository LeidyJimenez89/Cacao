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

	def self.effectydays (initdate, finaldate, paydate, admissiondate)

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
