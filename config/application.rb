require_relative "boot"

require "rails/all"
# require "rails"
# # Active Record (データベース)
# require "active_record/railtie"
# # Action Controller (コントローラー)
# require "action_controller/railtie"
# # Action View (ビュー)
# require "action_view/railtie"
# # Active Job (バックグラウンドジョブ)
# require "active_job/railtie"
# # Active Storage (ファイルアップロード)
# # require "active_storage/engine" # ← もし使わないならこれもコメントアウト
# # Action Cable (リアルタイム通信)
require "action_cable/engine"
Bundler.require(*Rails.groups)

module Posting
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 8.0
    config.autoload_lib(ignore: %w[assets tasks])
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
    # Railsはエラー時に自動で div.field_with_errors を付ける。それをやめて、デザイン崩れを防いだり独自の表示にしたいときに、
    # この一文を追加する。

    config.time_zone = "Asia/Tokyo"
  end
end
