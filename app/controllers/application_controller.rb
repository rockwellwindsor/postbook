class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Allowing custom parameters for Devise
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Checks to make sure a user is logged in, this will also redirect with expired sessions that have ended.
  before_action :is_signed_in?
  # Have to skip the is_signed_in? method with authentication pages because that is where user signs in.
  skip_before_action :is_signed_in?, if: :devise_controller?

  private
    # redirect if no user is detected
    def is_signed_in?
      unless user_signed_in? 
        redirect_to new_user_session_path
      end
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    end
end
