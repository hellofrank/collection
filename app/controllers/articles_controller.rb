class ArticlesController < ApplicationController
	def index
		@articles = Article.paginate(:page => params[:page], :per_page => 5)
		@newst_articles = Article.limit(5)
		@recommend_articles = Article.where('recommend' => true).limit(5)
		@categories = Category.all
	end

	def show
		@article = Article.find(params[:id])
		@newst_articles = Article.limit(7)
		@recommend_articles = Article.where('recommend' => true).limit(5)
		@keywords = @article.keywords
		@categories = Category.all
		@category = @article.category
		@all_comments = @article.comments
	end

end
