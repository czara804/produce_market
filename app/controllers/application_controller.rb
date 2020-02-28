class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :bio, :firstname, :lastname, :profile)}
    end

    def after_update_path_for(resource)
      user_path(resource)
    end
end
