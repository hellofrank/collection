class Admins::ProjectsController < ApplicationController
  
  layout 'admin/application'

  before_filter :authenticate_admin!

  def new
	#@user = current_user
	@project = Project.new
    @company = Company.find(params[:company_id])
  end

  def create
    @company = Company.find(params[:company_id])
    @project = @company.projects.create(params[:project])
    if @project
      redirect_to admins_company_path(@company)
     else
      render new_admins_company_project_path(@company)
     end
  end

  def edit
	#@user = current_user
	@company = Company.find(params[:company_id])
	@project = @company.projects.find(params[:id])
  end

  def update
	  #@user = current_user
	  @company = Company.find(params[:company_id])
	  @project = @company.projects.find(params[:id])
	  if @project.update_attributes(params[:project])
		  redirect_to admins_company_path(@company)
	  else
		  render 'edit'
	  end
  end

  def show
    @company = Company.find(params[:company_id])
    @project = @company.projects.find(params[:id])
  end

  def view
	  @user = current_user
	  @company = Company.find(params[:company_id])
	  @project = @company.projects.find(params[:id])
  end

  def index
    @company = Company.find(params[:company_id])
    @projects = @company.projects
  end

  def destroy
	  @company = Company.find(params[:company_id])
	  @project = @company.projects.find(params[:id])
	  @project.destroy
	  redirect_to user_path current_user
  end

end
