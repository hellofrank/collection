class AddressesController < ApplicationController
  
  def new
	  #@user = current_user
	  @address = Address.new
	  @company = Company.find(params[:company_id])
  end

  def create
  	@company = Company.find(params[:company_id])
	@address = Address.create(params[:address])
	@company.address = @address
	if @company.address
		redirect_to new_admins_company_contact_path(@company)
	else
		render new_admins_company_address_path(@company)
	end
  end

  def edit
  	#@user = current_user
	@company = Company.find(params[:company_id])
	@address = @company.address
  end

  def update
  	#@user = current_user
	@company = Company.find(params[:company_id])
	@address = @company.address
	if @address.update_attributes(params[:address])
		redirect_to admins_company_path(@company)
	else
		render 'edit'
	end
  end

  def destroy
	  @company = Company.find(params[:company_id])
	  @address = @company.address
	  @address.destroy
	  redirect_to user_path current_user
  end

end
