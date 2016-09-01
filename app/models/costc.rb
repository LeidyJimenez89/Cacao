class Costc < ActiveRecord::Base
	has_many :labors, through: :labor_costc
	has_many :labor_costc

	attr_accessor :labors2
end
