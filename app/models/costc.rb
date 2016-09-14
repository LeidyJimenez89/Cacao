class Costc < ActiveRecord::Base
	has_many :labors, through: :labor_costc
	has_many :labor_costc
	has_many :sublots

	attr_accessor :labors2
	attr_accessor :sublots2
end
