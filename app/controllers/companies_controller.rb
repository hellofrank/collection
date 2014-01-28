class CompaniesController < ApplicationController

  before_filter :sign_in, only: [:edit, :destroy,:create,:update,:base,:projects]
  def index
    @companies = Company.where('show' => true)
  end

  def show
    @company = Company.find(params[:id])
    @projects = @company.projects
	  @address = @company.address
    @doing_result_sets = @company.doing_result_sets
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
	  @company= Company.find(params[:id])
  end

  def projects
	  @company = Company.find(params[:id])
	  @projects = @company.projects
  end

  def demos
	  @company = Company.find(params[:id])
	  @demos = @company.demos
  end

  def contact
  	#@user = current_user
	  @company = Company.find(params[:id])
	  @contact = @company.contact
  end

  def address
	@company = Company.find(params[:id])	
	@address = @company.address
  end

  def owner
	@company = Company.find(params[:id])
	@owner = @company.owner
  end
  #def admin_user
   # redirect_to(root_path) unless current_user.admin?
  #end

  def sign_in
	  redirect_to(root_path) unless current_user
  end

end
