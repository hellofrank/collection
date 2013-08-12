class ProjectsController < ApplicationController
  def new
	@user = current_user
    @company = Company.find(params[:company_id])
  end

  def create
    @company = Company.find(params[:company_id])
    @project = @company.projects.create(params[:project])
    if @project
      redirect_to company_project_path(@company,@project)
     else
      render new_company_project_path(@company)
     end
  end

  def edit
	@user = current_user
	@company = Company.find(params[:company_id])
	@project = @company.projects.find(params[:id])
  end

  def show
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
