class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user! # この行を追加することで、全てのアクションでユーザー認証を要求します
  allow_browser versions: :modern

  private
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :email ])
    end
end
