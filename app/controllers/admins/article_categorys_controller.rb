class Admins::ArticleCategorysController < ApplicationController
	before_filter :authenticate_admin!

	def create
		@category = ArticleCategory.new
		@category.category = params[:category]
		@category.save
		respond_to :js
	end
end
