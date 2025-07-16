class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_permitted_account_update_parameters, if: :devise_controller?
  before_action :authenticate_user! # この行を追加することで、全てのアクションでユーザー認証を要求します
  allow_browser versions: :modern



  private
    def configure_permitted_parameters # 新規登録時の許可するパラメータをここで設定
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :name ])
      # 新規登録時の許可するパラメータをここで設定。emailとpasswordはデフォルトで許可されている。
    end

    def configure_permitted_account_update_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [ :name ])
      # アカウント更新時の許可するパラメータをここで設定。emailとpasswordはデフォルトで許可されている。
    end

    # def configure_permitted_sign_in_parameters
    #   devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    # end
    # deivseではサインインのパラメーターはデフォルトでemailとpasswordが許可されているため、
    # 今後この2つのカラム以外でログインに必要な項目が追加されれば、ここで追加して許可する必要がある。

    def after_sign_in_path_for(resource_or_scope)
      root_path # サインインした後のリダイレクト先をここで設定する
    end
end
