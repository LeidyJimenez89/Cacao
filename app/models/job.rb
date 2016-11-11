class Job < ActiveRecord::Base
	has_many :operators

	has_many :supervisors

	has_many :labors, through: :labor_job
	has_many :labor_job

	belongs_to :recordjob

	has_many :transcriptions

	has_many :novelties

	attr_accessor :labors2
end
