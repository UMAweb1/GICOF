class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	# flashメッセージ種類追加
	add_flash_types :success, :info, :warning, :danger
	protect_from_forgery with: :exception
	def after_sign_in_path_for(resource)
		if resource.is_a?(Admin)
		  admins_users_path
		elsif current_user
	      user_path(current_user)
	  end
	end

	def after_sign_out_path_for(resource)
	    if resource == :admin
	      new_admin_session_path
	    else
	      root_path
	    end
	end

	def configure_permitted_parameters
	  added_attrs = [ :first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :prefecture, :active_area, :birthday, :event_id]
	  devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    end
end
