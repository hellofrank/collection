class CommentsController < ApplicationController
	def create
		co = params[:comment]
		@article = Article.find(params[:id])
		@comment = Comment.new(co)
		@comment.article = @article
		@comment.user = current_user
		if @comment.save
			redirect_to(article_path(@article))
		end
	end
end
