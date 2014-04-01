require 'fileutils'
class Admins::ArticlesController < ApplicationController

	layout 'admin/application'

	before_filter :authenticate_admin!

	def index
		@articles = Article.all 
	end

	def new
		#@admin = current_admin
		@article = Article.new
		@category = Category.new
		@categories = Category.all
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
		@categories = Category.all
	end

	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(params[:article])
			redirect_to admins_manager_path
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@content = @article.content
		@temp_content = @content.gsub(/\s/,"")
		@temp_content.scan(/src="(.*?)"alt/i).each do |item|
			if (item != nil)
				@image_path = "#{Rails.root}/public"+item.join()
				#@image_path = item.join()
				FileUtils.rm(@image_path)			
			end
		end
		@article.destroy
		redirect_to admins_articles_path
	end

	#def show
	#	@article = Article.find(params[:id])
	#end

end
