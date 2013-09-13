class Admins::SessionsController < Devise::SessionsController
	
	def after_sign_in_path_for(resource)
		admins_manager_path
	end

	def after_sign_out_path_for(resource)
		new_admin_session_path
	end

end
