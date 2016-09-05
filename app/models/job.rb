class Job < ActiveRecord::Base
	has_many :operators
	has_many :supervisors
end
