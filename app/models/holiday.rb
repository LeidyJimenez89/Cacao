class Holiday < ActiveRecord::Base

	def self.effectydays (initdate, finaldate, admissiondate)

		diasFestivos = Holiday.where({numberyear: finaldate.strftime("%Y") , numbermonth: finaldate.strftime("%m")}).count
		
		cont=0
		contsunday=0

		for i in initdate.strftime("%d")..finaldate.strftime("%d")
			if (i + finaldate.strftime("%m") + finaldate.strftime("%Y"))to_date.strftime("%A") == Sunday
				contsunday = contsunday +1
			end
		end

		if admissiondate.strftime("%m") == finaldate.strftime("%m") and admissiondate.strftime("%Y") == finaldate.strftime("%Y")
			return diasEfectivos = 30 - admissiondate.strftime("%d") - contsunday - diasFestivos - 1
		elsif admissiondate.strftime("%m") != finaldate.strftime("%m") and admissiondate.strftime("%Y") != finaldate.strftime("%Y")
			return diasEfectivos = 30 - contsunday - diasFestivos - 1
		end

	end

end
