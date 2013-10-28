class Admins::ArticlesController < ApplicationController

	layout 'admin/application'

	before_filter :authenticate_admin!

	def index
		@articles = Article.all 
	end

	def new
		#@admin = current_admin
		@article = Article.new
	end

	def create
		#@admin = current_admin
		@article = Article.new(params[:article])
		if @article.save
			redirect_to admins_articles_path
		else
			render new_admins_article_path
		end
	end
	
	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(params[:article])
			redirect_to admins_manager_path
		else
			render 'edit'
		end
	end

	#def show
	#	@article = Article.find(params[:id])
	#end

end
