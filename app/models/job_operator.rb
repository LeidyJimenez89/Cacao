class JobOperator < ActiveRecord::Base
	belongs_to :operator
	belongs_to :job
end
