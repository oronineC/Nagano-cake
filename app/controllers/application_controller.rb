class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

	#仮設定
	def after_sign_in_path_for(resource)
	  case resource
	  when Admin
	    admin_homes_top_path
	  when Customer

	    root_path(resource)
	  end
	end


  #仮設定
	def after_sign_out_path_for(resource)
	    new_session_path(resource)
	end



	protected
	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:lastNameKanji, :first_name_kanji, :last_name_kana, :first_name_kana, :postcode, :street_address, :phone_number, :email, :password, :password_confirmation ])
	    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
	end
end
