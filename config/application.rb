require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BookStore
  class Application < Rails::Application
    config.i18n.available_locales = %W(en ru)
    config.i18n.default_locale = :ru
    config.action_dispatch.default_headers = {
        'X-Frame-Options' => 'ALLOWALL'
    }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
