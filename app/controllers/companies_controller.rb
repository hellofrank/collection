class CompaniesController < ApplicationController

  #before_filter :sign_in, only: [:edit, :destroy,:create,:update,:base,:projects]
  def index
    @companies = Company.where('show' => true)
  end

  def show
    @company = Company.find(params[:id])
    @projects = @company.projects
	  @address = @company.address
    @doing_result_sets = @company.doing_result_sets
  end

end
