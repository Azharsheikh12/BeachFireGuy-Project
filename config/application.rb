require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BeachFireGuyFinal
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    config.assets.compile = true
    config.assets.digest = true
    config.assets.enabled = true
    # config.eager_load_paths << Rails.root.join("extras")

    config.twilio_account_sid = ENV['TWILIO_ACCOUNT_SID']
    config.twilio_auth_token = ENV['TWILIO_AUTH_TOKEN']
    config.twilio_phone_number = ENV['TWILIO_PHONE_NUMBER'
  end
end
