class Labor < ActiveRecord::Base
	has_many :costcs, through: :labor_costc
	has_many :labor_costc
end
