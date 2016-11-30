class Billingc < ActiveRecord::Base
	has_many :operator
	has_many :supervisor
end