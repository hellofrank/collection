class LogsController < ApplicationController
	def new
		@log = Log.new
		#@user = current_user
	end

	def create
		@log = current_user.logs.create(params[:log])
		if @log
			redirect_to log_path(@log)
		else
			render new_log_path
		end
	end

	def show
		@log = Log.find(params[:id])
	end
end
