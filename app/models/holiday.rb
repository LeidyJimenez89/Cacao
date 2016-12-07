class Holiday < ActiveRecord::Base

	def self.effectydays (initdate, finaldate, admissiondate)

		diasFestivos = Holiday.where({completeday: between initdate and })
		
		festivos = Hash.new
		diasFestivos.each do |d|
			festivos[d.numbermonth] = d.numberday
		end

		contholiday=0
		contsunday=0


		for i in initdate.strftime("%d")..finaldate.strftime("%d")
			if (i.to_s+ " " +finaldate.strftime("%m").to_s + " " +finaldate.strftime("%Y").to_s).to_date.strftime("%A") == "Sunday"
				contsunday = contsunday +1
			end

			festivos.each do |d|
				if i == d[1]
					contholiday = contholiday +1
				end
			end
		end

		if admissiondate.strftime("%m") == finaldate.strftime("%m") and admissiondate.strftime("%Y") == finaldate.strftime("%Y")
			return 30 - (admissiondate.strftime("%d")).to_i - contsunday - diasFestivos - 1
		elsif admissiondate.strftime("%m") != finaldate.strftime("%m") and admissiondate.strftime("%Y") != finaldate.strftime("%Y")
			return 30 - contsunday - diasFestivos - 1
		end

	end

end
