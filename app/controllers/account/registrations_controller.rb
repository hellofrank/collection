class Account::RegistrationsController < Devise::RegistrationsController

	def create
		build_resource(sign_up_params)

		resource_saved = resource.save
		yield resource if block_given?
		if resource_saved
			if resource.active_for_authentication?
				set_flash_message :notice, :signed_up if is_flashing_format?
				sign_up(resource_name, resource)
				respond_with resource, location: after_sign_up_path_for(resource)
			else
				set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
				expire_data_after_sign_in!
				respond_with resource, location: after_inactive_sign_up_path_for(resource)
			end
		else
			clean_up_passwords resource
			respond_with resource
		end
	end
	
	#解决密码为空时，不能更新其他项的问题。
	def update
		# For Rails 4
		#account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
		# For Rails 3
		account_update_params = params[:user]

		# required for settings form to submit when password is left blank
		if account_update_params[:password].blank?
			account_update_params.delete("password")
			account_update_params.delete("password_confirmation")
			account_update_params.delete("current_password")
		end

		@user = User.find(current_user.id)
		if @user.update_attributes(account_update_params)
			set_flash_message :notice, :updated
			# Sign in the user bypassing validation in case his password changed
			sign_in @user, :bypass => true
			redirect_to after_update_path_for(@user)
		else
			render "edit"
		end
	end
end
