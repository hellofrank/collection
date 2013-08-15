class ContactsController < ApplicationController
  
  def new
	  @user = current_user
	  @company = Company.find(params[:company_id])
  end

  def create
  	@company = Company.find(params[:company_id])
	@contact = @company.contacts.create(params[:contact])
	if @contact
		redirect_to user_path(current_user)
	else
		render new_company_contact_path(@company)
	end
  end

  def edit
	  @user = current_user
	  @company = Company.find(params[:company_id])
	  @contact = @company.contacts.find(params[:id])
  end

  def update
  	@user = current_user
	@company = Company.find(params[:company_id])
	@contact = @company.contacts.find(params[:id])
	if @contact.update_attributes(params[:contact])
		redirect_to contact_user_company_path(@user,@company)
	else
		render 'edit'
	end
  end

  def destroy
  	@company = Company.find(params[:company_id])
	@contact = @company.contacts.find(params[:id])
	@contact.destroy
	redirect_to user_path current_user
  end

end
