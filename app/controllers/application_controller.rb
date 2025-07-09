class ApplicationController < ActionController::Base
 before_action :configure_permitted_parameters, if: :devise_controller?
 allow_browser versions: :modern

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :email ])
    end
end
