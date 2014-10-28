require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Cdp
  class Application < Rails::Application
    config.action_mailer.default_options = {
      from: 'cmf@example.org'
    }

    config.i18n.available_locales = [:en, :de]
    config.i18n.fallbacks = true
  end
end
