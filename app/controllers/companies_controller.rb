class CompaniesController < ApplicationController

  before_filter :authenticate_user!,only: [:view]
  before_filter :authenticate_user, only:[:update]
  before_filter :authenticate_admin,only:[:create,:index,:destroy]
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

end
