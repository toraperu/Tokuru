class ApplicationController < ActionController::Base
	#フレンドリーフォワード
	before_action :store_current_location, if: :storable_location?
	#退会してるか否かをチェック
	before_action :resignation_user?

	def resignation_user?
	    if user_signed_in?
	    	session[:user_id] = current_user.id
	        if current_user.resignation == true
	        	sign_out(current_user)
	      	end
	    end
	end

	private

	#ログイン後のリダイレクト先
	def after_sign_in_path_for(resource_or_scope)
		if resource_or_scope.is_a?(Admin)
			admins_admins_top_path
		else
			stored_location_for(resource_or_scope)|| super
		end
	end

	def after_sign_out_path_for(resource_or_scope)
		if resource.is_a?(Admin)
			new_admin_session_path
		else
			root_path
		end
	end

	def storable_location?
	    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
  	end

	def store_current_location
		store_location_for(:user, request.fullpath)
	end
end
