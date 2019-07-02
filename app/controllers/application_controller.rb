class ApplicationController < ActionController::Base
	#退会してるか否かをチェック
	before_action :resignation_user?
	
	def resignation_user?
	    if user_signed_in?
	        if current_user.resignation == true
	        	sign_out(current_user)
	      	end
	    end
	end
end
