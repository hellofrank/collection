class Admins::LogsController < ApplicationController
	layout 'admin/application'
	
	before_filter :authenticate_admin!

	def index
		@logs = Log.all
	end
end
