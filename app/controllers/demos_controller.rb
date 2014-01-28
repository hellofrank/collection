class DemosController < ApplicationController

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

	def show
		@demo = Demo.find(params[:id])
	end

	def get_demos
		@company = Company.find(params[:id])
		@demos = @company.demos
		respond_to do |format|
			format.js
		end
	end

	def destroy
	end
end
