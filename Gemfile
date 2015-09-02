# encoding: utf-8
source 'https://rubygems.org'
ruby File.read('.ruby-version').strip

gem 'rails',          '~> 3.2'
gem 'nokogiri',       '~> 1.6'
gem 'pg'
gem 'jquery-rails'
gem 'haml-rails'
gem 'bcrypt-ruby',    '~> 3.0.1'
gem 'mercury-rails',  '~> 0.9'

gem 'redcarpet',      '~> 2.0'
gem 'rubocop'

group :production do
  gem 'unicorn'
  gem 'rails_12factor'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'compass-rails'
  gem 'compass-blueprint'
  gem 'uglifier'
end

group :test, :development do
  gem 'rspec', '~> 2.14.1'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'test-unit'

  gem 'sqlite3'

  gem 'coveralls',   '~> 0.6',     require: false
end

group :development do
  gem 'letter_opener'
  gem 'annotate'

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'pry'

  gem 'foreman'

  gem 'guard-bundler'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'guard-shell'

  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'rb-fsevent'
  gem 'terminal-notifier-guard'
  gem 'terminal-notifier'
end
