class DemosController < ApplicationController

	def new
	  @user = current_user
	  @company = Company.find(params[:company_id])
	end

	def create
		@company = Company.find(params[:company_id])
		@demo = @company.demos.create(params[:demo])
		if @demo
			redirect_to user_path(current_user)
		else
			render new_company_demo_path(@company)
		end
	end

	def edit
		@user = current_user
		@company = Company.find(params[:company_id])
		@demo = @company.demos.find(params[:id])
	end

	def update
		@user = current_user
		@company = Company.find(params[:company_id])
		@demo = @company.demos.find(params[:id])
		if @demo.update_attributes(params[:demo])
			redirect_to demos_user_company_path(@user,@company)
		else
			render 'edit'
		end
	end

	def show
		@user = current_user
		@company = Company.find(params[:company_id])
		@demo = @company.demos.find(params[:id])
	end

	def view
		@user = current_user
		@company = Company.find(params[:company_id])
		@demo = @company.demos.find(params[:id])
	end

	def destroy
		@company = Company.find(params[:company_id])
		@demo = @company.demos.find(params[:id])
		@demo.destroy
		redirect_to user_path current_user
	end
end
