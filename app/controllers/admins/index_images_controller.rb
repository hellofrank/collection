require 'fileutils'
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
	
	def destroy
		@index_image = IndexImage.find(params[:id])
		@index_image_url = @index_image.image_url
		@index_image_position = @index_image_url.rindex("/")
		@index_image_position = @index_image_position.to_i
		@index_image_dir_path = @index_image_url[0..@index_image_position]
		@new_index_image_path = "#{Rails.root}/public"+@index_image_dir_path
		FileUtils.rm_rf(Dir[@new_index_image_path])
		@index_image.destroy
		redirect_to admins_manager_path
	end

end
