class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  protect_from_forgery with: :exception

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |user|
      user.permit(:first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :address)
    end
    devise_parameter_sanitizer.permit(:account_update) do |user|
      user.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :address)
    end
  end
end
