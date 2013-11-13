class UsersController < ApplicationController
  
  before_filter :signed_in, only: [:show,:update,:edit]
  before_filter :auth_admin, only: [:index,:delete]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
	@logs = @user.logs
	@comments = @user.comments
	#@company = @user.companies.first
#	@projcets = @company.projcets 
  end

  def edit
    @user = current_user
  end

  def delete
    @user = User.find(params[:id])
    @user.destory
  end
  
  private 

   def signed_in
	   redirect_to(root_path) unless current_user
   end

   def auth_admin
	   redirect_to(root_path) unless current_admin
   end


end
