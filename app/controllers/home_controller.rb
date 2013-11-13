class HomeController < ApplicationController
  def index
    @all_companies = Company.where('show' => true)
    @recently_companies = Company.where('show' => true).limit(3)
	@recently_articles = Article.limit(7)
	@all_articles = Article.all
  end

  def show_article
	  #@comment = Comment.new
	  @article = Article.find(params[:id])
	  #@all_comments = Comment.find(params[:id])
	  @all_comments = @article.comments
  end
end
