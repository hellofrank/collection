class HomeController < ApplicationController
  def index
    #@users = User.all
    #@current_user = current_user
    #@companies = @current_user.companies
    @all_companies = Company.all
    @recently_companies = Company.limit(3)
  end
end
