class ResultsController < ApplicationController

	def show
		@results = DoingResultSet.find(params[:id])
		@company = @results.company
		@allresultImages = @results.doing_results
		@resultImages = @results.doing_results.paginate(:page => params[:page], :per_page => 3)
		@resultImagesCount = @allresultImages.length;
		@pageNums = @resultImagesCount/3
		if (@resultImagesCount%3 == 0)
			@realPageNums = @pageNums
		else
			@realPageNums = @pageNums+1
		end
	end

	def get_pages
		@results = DoingResultSet.find(params[:id])
		@company = @results.company
		@resultImages = @results.doing_results.paginate(:page => params[:page], :per_page => 3)
		respond_to do |format|
			format.json { render :json => @resultImages }
		end
	end

end
