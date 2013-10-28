class ContactsController < ApplicationController
  
  def new
	  #@user = current_user
	  @contact = Contact.new
	  @company = Company.find(params[:company_id])
  end

  def create
  	@company = Company.find(params[:company_id])
	@contact = Contact.create(params[:contact])
	@company.contact = @contact
	#@contact = @company.contact.create(params[:contact])
	if @company.contact
		redirect_to new_admins_company_owner_path(@company)
	else
		render new_admins_company_contact_path(@company)
	end
  end

  def edit
	 #@user = current_user
	  @company = Company.find(params[:company_id])
	  @contact = @company.contact
  end

  def update
  	#@user = current_user
	@company = Company.find(params[:company_id])
	@contact = @company.contact
	if @contact.update_attributes(params[:contact])
		redirect_to admins_company_path(@company)
	else
		render 'edit'
	end
  end

  def destroy
  	@company = Company.find(params[:company_id])
	@contact = @company.contact
	@contact.destroy
	redirect_to user_path current_user
  end

end
