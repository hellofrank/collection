class DoingResultSetsController < ApplicationController

	def get_results
		@company = Company.find(params[:id])
		@results = @company.doing_result_sets
		respond_to do |format|
			format.js
		end
	end
	
end