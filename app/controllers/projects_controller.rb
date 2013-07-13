class ProjectsController < ApplicationController
  def new
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

  def show
    @company = Company.find(params[:company_id])
    @project = @company.projects.find(params[:id])
  end

  def index
    @company = Company.find(params[:company_id])
    @projects = @company.projects.find_all
  end
end
