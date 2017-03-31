class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Allowing custom parameters for Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
    end
    
  private
      # Add the needed breadcrumb navigation
    def add_breadcrumbs
      add_breadcrumb "Home", :root_path
      if user_signed_in?
        add_breadcrumb "New", new_post_path
      end
    end
end
