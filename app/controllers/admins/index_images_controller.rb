class Admins::IndexImagesController < ApplicationController
	layout 'admin/application'
	before_filter :authenticate_admin!

	def new
		@indexImage = IndexImage.new
	end

	def create
		@indexImage = IndexImage.new(params[:index_image])
		if @indexImage.save
			redirect_to admins_manager_path
		else
			render new_admins_index_image_path
		end
	end

	def edit
		@indexImage = IndexImage.find(params[:id])
	end

	def update
		@indexImage = IndexImage.find(params[:id])
		if @indexImage.update_attributes(params[:index_image])
			redirect_to admins_manager_path
		else
			render 'edit'
		end
	end

end
