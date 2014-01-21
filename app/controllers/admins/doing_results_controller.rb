class Admins::DoingResultsController < ApplicationController

	def new
		@doing_result_set = DoingResultSet.find(params[:doing_result_set_id])
		@doing_result = DoingResult.new
	end
	
	def create
		@company = Company.find(params[:company_id])
		@doing_result_set = @company.doing_result_sets.create(params[:doing_result_set])
     	if @doing_result_set
     		redirect_to admins_company_path(@company)
     	else
     		render new_admins_company_doing_result_set_path(@company)
     	end
	end

	def create
		@doing_result_set = DoingResultSet.find(params[:doing_result_set_id])
		@company = @doing_result_set.company
		@doing_result = @doing_result_set.doing_results.create(params[:doing_result])
		if @doing_result
			redirect_to admins_company_path(@company)
		else
			render new_admins_doing_result_set_doing_result_path(@doing_result_set)
		end
	end

	def edit
		
	end

	def update
		
	end

	def destroy
		
	end
end