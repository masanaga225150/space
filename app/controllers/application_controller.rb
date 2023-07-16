class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :email, :password, :password_confirmation])
  end
end