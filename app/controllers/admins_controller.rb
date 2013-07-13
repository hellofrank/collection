 class AdminsController < ApplicationController
 	before_filter :authenticate_admin!
 	
 	def index
 		@admis = Admin.all
 		@users = User.all
 		@companies = Company.all
 	end

 	def delete_company
 		@company = Company.find(params[:id])
 		@company.destory 
 	end

 	def delete_user
 		@user = User.find(params[:id])
 		@user.destory
 	end

 end