class AddressesController < ApplicationController
  
  def new
	  @user = current_user
	  @company = Company.find(params[:company_id])
  end

  def create
  	@company = Company.find(params[:company_id])
	@address = @company.addresses.create(params[:address])
	if @address
		redirect_to user_path(current_user)
	else
		render new_company_address_path(@company)
	end
  end

  def edit
  	@user = current_user
	@company = Company.find(params[:company_id])
	@address = @company.addresses.find(params[:id])
  end

  def update
  	@user = current_user
	@company = Company.find(params[:company_id])
	@address = @company.addresses.find(params[:id])
	if @address.update_attributes(params[:address])
		redirect_to address_user_company_path(@user,@company)
	else
		render 'edit'
	end
  end

  def destroy
	  @company = Company.find(params[:company_id])
	  @address = @company.addresses.find(params[:id])
	  @address.destroy
	  redirect_to user_path current_user
  end

end
