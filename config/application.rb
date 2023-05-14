require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SampleApp2
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # crossorigin 属性を use-credentials に設定する
   config.action_dispatch.default_headers = {
   'Access-Control-Allow-Origin' => 'ENV["Production"]',
   'Access-Control-Allow-Credentials' => 'true'
   }

   config.assets.paths << Rails.root.join('app', 'assets', 'fonts')
   config.assets.paths << Rails.root.join('app', 'assets', 'images')
   config.assets.paths << Rails.root.join('app', 'assets', 'stylesheets')
   Rails.application.config.assets.precompile += %w( *.eot *.woff *.ttf *.svg *.otf *.png *.jpg *.jpeg *.gif vendor.css vendor.js )

  end
end
