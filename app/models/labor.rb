class Labor < ActiveRecord::Base
	has_many :costcs, through: :labor_costc
	has_many :labor_costc

	has_many :jobs, through: :labor_job
	has_many :labor_job

	has_many :transcriptions

	has_many :novelties

	attr_accessor :costcs2
end
