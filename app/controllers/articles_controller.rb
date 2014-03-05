class ArticlesController < ApplicationController
	def index
		@articles = Article.paginate(:page => params[:page], :per_page => 5)
		@newst_articles = Article.limit(5)
		@command_artilces = Article.limit(5)
	end

	def get_categorys
		@category_articles = Article.where("category=?", params[:category]).paginate(:page => params[:page], :per_page => 5)
	end

end
