class Admins::CompaniesController < ApplicationController
	layout 'admin/application'
	before_filter :authenticate_admin!

	def index
		@companies = Company.all
	end

	def new
		@admin = current_admin
		@company = Company.new
	end

	def show
		@company = Company.find(params[:id])
    	@projects = @company.projects
		@contact = @company.contact
		@owner = @company.owner
		@address = @company.address
		@province = Province.find(@address.province_id)
		@city = City.find(@address.city_id)
		@district = District.find(@address.district_id)
	end

	def create
		@company = Company.new(params[:company])
		if @company.save
			redirect_to new_admins_company_address_path(@company)
		else
			render new_admins_company_path
		end
	end
	
	def edit
		@company = Company.find(params[:id])
	end

	def updateshow
		@company = Company.find(params[:id])
		@company.show = params[:show]
		@company.save
		respond_to :js
	end

	def update
		@company = Company.find(params[:id])
		if @company.update_attributes(params[:company])
			redirect_to admins_company_path(@company)
		else
			render 'edit'
		end
	end
end
