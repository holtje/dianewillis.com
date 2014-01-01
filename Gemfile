# encoding: utf-8
source 'https://rubygems.org'
ruby File.read('.ruby-version').strip

gem 'rails',          '~> 3.2.16'
gem 'nokogiri'
gem 'pg'
gem 'jquery-rails'
gem 'haml-rails'
gem 'bcrypt-ruby',    '~> 3.0.0'
gem 'mercury-rails',  '~> 0.9.0'

gem 'redcarpet',      '~> 2.0'
gem 'thin'

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'compass-rails'
  gem 'uglifier'
end

group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'capybara'

  gem 'sqlite3'

  gem 'coveralls',   '~> 0.6'
end

group :development do
  gem 'letter_opener'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'pry'

  gem 'heroku'
  gem 'foreman'
  gem 'taps'

  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-migrate'
  gem 'guard-shell'

  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'terminal-notifier-guard'
  gem 'terminal-notifier'
end
