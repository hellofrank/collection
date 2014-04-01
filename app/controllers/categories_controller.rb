class CategoriesController < ApplicationController
	def show
		@category = Category.find(params[:id])
		@newst_articles = Article.limit(7)
		@categories = Category.all
		@command_artilces = Article.limit(7)
		@category_articles = @category.articles.paginate(:page => params[:page], :per_page => 5) 
	end
end
