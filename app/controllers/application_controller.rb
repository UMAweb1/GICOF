class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		if resource.is_a?(Admin)
		  root_path
		elsif current_user
	      flash[:notice] = ""
	      user_path(current_user)  #　指定したいパスに変更
	  end
	end

	def configure_permitted_parameters
	  added_attrs = [ :first_name, :last_name, :first_name_kana, :last_name_kana, :nickname, :prefecture, :active_area, :birthday, :event_id]
	  devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    end
end
