source :rubygems

gem 'rails', '3.1.1'
gem 'pg'
gem 'jquery-rails'
gem 'haml-rails'
gem 'redcarpet', '~> 2.0.0b5'
gem 'exception_notification'
gem 'activeadmin'
# sass-rails usually goes in assets, but
# active admin gets upset in that case. :-(
gem 'sass-rails',   '~> 3.1.4'

group :assets do
  gem 'coffee-rails', '~> 3.1.1'
  gem 'compass', '~> 0.12.alpha'
  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem "rspec-rails"
  gem 'rb-fsevent'
  gem 'growl'
  gem 'pry'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem "factory_girl_rails"
  gem "capybara"
  gem "spork", "~> 0.9.0.rc9"
  gem "guard-bundler"
  gem "guard-rspec"
  gem "guard-spork"
  gem "guard-migrate"
end

group :development do
  gem 'heroku'
end