class UsersController < ApplicationController
  before_filter :authenticate_user!, only: [:view]
  before_filter :authenticate_admin, only: [:delete,:index]
  before_filter :current_user, only: [:edit, :update]
  

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def delete
    @user = User.find(params[:id])
    @user.destory
  end
  
  #private 

   # def admin_user
    #  redirect_to(root_path) unless current_user.admin?
    #end
    
end
