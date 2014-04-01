class UsersController < ApplicationController
  
  before_filter :signed_in, only: [:show,:update,:edit]
  before_filter :auth_admin, only: [:index,:delete]

  #def index
   # @users = User.all
  #end

  def show
    @user = User.find(params[:id])
	@logs = @user.logs
	@comments = @user.comments
  end

  #def edit
   # @user = current_user
  #end

  #def delete
   # @user = User.find(params[:id])
    #@user.destory
  #end
 
  def update
	  @user = User.find(params[:id])
	  if @user.update_attributes(params[:user])
		  redirect_to user_path(current_user)
	  else
		  render 'edit'
	  end
  end

  private 

   def signed_in
	   redirect_to(root_path) unless current_user
   end

   def auth_admin
	   redirect_to(root_path) unless current_admin
   end


end
