class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

	#仮設定
	def after_sign_in_path_for(resource)
	  case resource
	  when Admin
	    admin_customers_path
	  when Customer
	    root_path(resource)
	  end
	end


  #仮設定
	def after_sign_out_path_for(resource)
	    new_session_path(resource)
	end



	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
	end
end
