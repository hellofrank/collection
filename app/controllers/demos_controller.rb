class DemosController < ApplicationController

	def show
		@demo = Demo.find(params[:id])
		@company = @demo.company
	end

	def get_demos
		@company = Company.find(params[:id])
		@demos = @company.demos
		respond_to do |format|
			format.js
		end
	end

end
