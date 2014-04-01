class Admins::CategoriesController < ApplicationController
	before_filter :authenticate_admin!

	#def new
	#	@category = Category.new
	#end
	def create
		@category = Category.new(params[:category])
		@category.save
		respond_to :js
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to new_admins_article_path
	end
end
