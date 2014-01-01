# encoding: UTF-8
require File.expand_path('../boot', __FILE__)

require 'rails/all'

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(assets: %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module Dianewillis
  # Main Rail Application
  class Application < Rails::Application
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += Dir["#{config.root}/lib/**/"]

    config.i18n.enforce_available_locales = true

    config.encoding = 'utf-8'

    config.filter_parameters += [:password]

    config.active_support.escape_html_entities_in_json = true

    config.active_record.whitelist_attributes = true

    config.assets.enabled = true

    config.assets.version = '1.0'

    config.generators do |g|
      g.test_framework :rspec, fixture: true
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.template_engine :haml
    end

    config.mercury_config = {
    }
    config.mercury_page_editor_config = {
      saveStyle: 'form',
      saveMethod: 'PUT',
      visible: true,
    }

    config.active_record.timestamped_migrations = false
  end
end
