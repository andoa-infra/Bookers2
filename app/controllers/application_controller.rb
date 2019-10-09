class ApplicationController < ActionController::Base

before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
		user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
  	    flash[:notice] = "successfully"
  	    root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end

Refile.secret_key = '2ada6cbb0944d5ee3a2f04f7164c6bed9c240c45e32eb6b76cd301625bd3144ae805a8495367035d95a4de82d9fde745bcc15b6a6d7a631b037ee8d5a8f8f88e'
