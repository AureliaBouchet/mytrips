class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if:  :devise_controller?

private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo, :name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo, :name])
  end
end
