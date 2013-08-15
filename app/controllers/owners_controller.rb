class OwnersController < ApplicationController
  
	def new
	  @user = current_user
	  @company = Company.find(params[:company_id])
  	end

	def create
		@user = current_user
		@company = Company.find(params[:company_id])
		@owner = @company.owners.create(params[:owner])
		if @owner
			redirect_to user_path(current_user)
		else
			render new_company_owner_path(@company)
		end
	end

	def edit
		@user = current_user
		@company = Company.find(params[:company_id])
		@owner = @company.owners.find(params[:id])
	end

	def update
		@user = current_user
		@company = Company.find(params[:company_id])
		@owner = @company.owners.find(params[:id])
		if @owner.update_attributes(params[:owner])
			redirect_to owner_user_company_path(@user,@company)
		else
			render 'edit'
		end
	end

	def destroy
		@user = current_user
		@company = Company.find(params[:company_id])
		@owner = @company.owners.find(params[:id])
		@owner.destroy
		redirect_to user_path @user
	end
	
end
