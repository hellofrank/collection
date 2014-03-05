class HomeController < ApplicationController
  def index
    @all_companies = Company.where('show' => true)
    @recently_companies = Company.where('show' => true).limit(3)
    @indexImages = IndexImage.all
	@recently_articles = Article.limit(7)
	@all_articles = Article.all
  end

  def show_article
	  #@comment = Comment.new
	  @article = Article.find(params[:id])
	  @newst_articles = Article.limit(7)
	  @command_articles = Article.limit(7)
	  @keywords = @article.keywords
	  @all_comments = @article.comments
  end
end
