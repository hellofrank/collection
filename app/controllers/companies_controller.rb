class CompaniesController < ApplicationController

  before_filter :sign_in, only: [:edit, :destroy,:create,:update,:base,:projects]
  def index
    @companies = Company.where('show' => true)
  end

  def show
    @company = Company.find(params[:id])
    @projects = @company.projects
	@address = @company.address
	@province = Province.find(@address.province_id)
	@city = City.find(@address.city_id)
	@district = District.find(@address.district_id)
  end

  def new
    @user = current_user
  end

  def edit
	@user = current_user
	@company = Company.find(params[:id])
  end

  def destroy
	@user = current_user
    @company = Company.find(params[:id])
    @company.destroy
  end

  def create
    @company = current_user.company.create(params[:company])
    if @company
      redirect_to user_company_path(current_user,@company)
    else
      render new_user_company_path(current_user)
    end
  end

  def update
	  @user = current_user
	  @company = Company.find(params[:id])
	  if @company.update_attributes(params[:company])
		  redirect_to company_path(@company)
	  else
		  render 'edit'
	  end
  end

  def base
	  @user = current_user
	  @company= Company.find(params[:id])
  end

  def projects
	  @user = current_user
	  @company = Company.find(params[:id])
	  @projects = @company.projects
  end

  def demos
	  @user = current_user
	  @company = Company.find(params[:id])
	  @demos = @company.demos
  end

  def contact
  	@user = current_user
	@company = Company.find(params[:id])
	@contact = @company.contacts.first 
  end

  def address
	@user = current_user
	@company = Company.find(params[:id])	
	@address = @company.addresses.first
	@province = Province.find(@address.province_id)
	@city = City.find(@address.city_id)
	@district = District.find(@address.district_id)
  end

  def owner
    @user = current_user
	@company = Company.find(params[:id])
	@owner = @company.owners.first
  end
  #def admin_user
   # redirect_to(root_path) unless current_user.admin?
  #end

  def sign_in
	  redirect_to(root_path) unless current_user
  end

end
