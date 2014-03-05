class Admins::DemosController < ApplicationController
	layout 'admin/application'

	before_filter :authenticate_admin!

	def new
		@demo = Demo.new
		@company = Company.find(params[:company_id])
	end

	def create
		@company = Company.find(params[:company_id])
		@demo = @company.demos.create(params[:demo])
		if @demo
			redirect_to admins_company_path(@company)
		else
			render new_admins_company_demo_path(@company)
		end
	end

	def edit
		@company = Company.find(params[:company_id])
		@demo = @company.demos.find(params[:id])
	end

	def update
		@company = Company.find(params[:company_id])
		@demo = @company.demos.find(params[:id])
		if @demo.update_attributes(params[:demo])
			redirect_to admins_company_path(@company)
		else
			render 'edit'
		end
	end

	def destroy
		@company = Company.find(params[:company_id])
		@demo  = @company.demos.find(params[:id])
		@demo.destroy
		redirect_to admins_company_path(@company)
	end
end
