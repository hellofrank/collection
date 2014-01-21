require 'fileutils'

class Admins::DoingResultSetsController < ApplicationController

	def new
		@doing_result_set = DoingResultSet.new
		@company = Company.find(params[:company_id])
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

	def edit
		@company = Company.find(params[:company_id])
		@doing_result_set = @company.doing_result_sets.find(params[:id])
	end

	def update
		@company = Company.find(params[:company_id])
		@doing_result_set = @company.doing_result_sets.find(params[:id])
		if @doing_result_set.update_attributes(params[:doing_result_set])
			redirect_to admins_company_path(@company)
		else
			render 'edit'
		end
	end

	def destroy
		@company = Company.find(params[:company_id])
		@doing_result_set = @company.doing_result_sets.find(params[:id])
		@doing_results = @doing_result_set.doing_results
		@doing_results.each do |doing_result|
			@image_dir = File.split(doing_result.image_url)[0]
			@new_image_dir = "#{Rails.root}/public"+@image_dir
			FileUtils.rm_rf(Dir[@new_image_dir])
		end
		@doing_result_set.destroy
		redirect_to admins_company_path(@company)	
	end

end