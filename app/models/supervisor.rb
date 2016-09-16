class Supervisor < ActiveRecord::Base
	belongs_to :job
	has_many :operators, through: :operator_supervisor
	has_many :operator_supervisor

	has_many :record_operators

	attr_accessor :operators2
end
