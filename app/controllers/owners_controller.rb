class OwnersController < ApplicationController
  
	def new
	  #@user = current_user
	  @owner = Owner.new
	  @company = Company.find(params[:company_id])
  	end

	def create
		#@user = current_user
		@company = Company.find(params[:company_id])
		@owner = Owner.create(params[:owner])
		@company.owner = @owner
		#@owner = @company.owner.create(params[:owner])
		if @company.owner
			redirect_to new_admins_company_project_path(@company)
		else
			render new_admins_company_owner_path(@company)
		end
	end

	def edit
		#@user = current_user
		@company = Company.find(params[:company_id])
		@owner = @company.owner
	end

	def update
		#@user = current_user
		@company = Company.find(params[:company_id])
		@owner = @company.owner
		if @owner.update_attributes(params[:owner])
			redirect_to admins_company_path(@company)
		else
			render 'edit'
		end
	end

	def destroy
		@user = current_user
		@company = Company.find(params[:company_id])
		@owner = @company.owner
		@owner.destroy
		redirect_to user_path @user
	end
	
end
