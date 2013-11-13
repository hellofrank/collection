class ProjectsController < ApplicationController
	def show
		@project = Project.find(params[:id])
		@company = @project.company
	end
end
