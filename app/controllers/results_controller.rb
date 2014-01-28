class ResultsController < ApplicationController

	def show
		@results = DoingResultSet.find(params[:id])
		@company = @results.company
		@resultImages = @results.doing_results
	end

end