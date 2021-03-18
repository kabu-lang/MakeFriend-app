require_relative 'boot'
# activestorageを使わずにcarrierwaveを使うので以下の記事を参考に設定を変更
# https://tech.dely.jp/entry/2019/12/22/145733#CarrierWave%E3%81%B8%E4%B9%97%E3%82%8A%E6%8F%9B%E3%81%88%E3%82%8B%E6%89%8B%E9%A0%86

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"
require "action_cable/engine"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MakeFriendApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # config.time_zone = 'Tokyo'
    #     config.active_record.default_timezone = :local
    #     config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
        config.i18n.default_locale = :ja

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
