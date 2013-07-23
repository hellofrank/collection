class CompaniesController < ApplicationController

  before_filter :sign_in
  def index
    @companies = Company.all
  end

  def show
    @company = Company.find(params[:id])
    @projects = @company.projects
  end

  def new
    @user = current_user
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy
  end

  def create
    @company = current_user.companies.create(params[:company])
    if @company
      redirect_to user_company_path(current_user,@company)
    else
      render new_user_company_path(current_user)
    end
  end

  #def admin_user
   # redirect_to(root_path) unless current_user.admin?
  #end

  def sign_in
	  redirect_to(root_path) unless current_user
  end

end
