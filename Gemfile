# frozen_string_literal: true

source 'https://rubygems.org'

gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'pg'
gem 'rails', '~> 6.1'
gem 'test-unit', '~> 3.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'coffee-rails'
  gem 'sass-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'byebug', '9.0.6' # forced version
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'mocha', '1.3.0' # forced version
  gem 'pry'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'rubocop-rails'
  gem 'shoulda', '~> 3.5'
  gem 'shoulda-matchers'
end

group :test do
  gem 'capybara'
  gem 'launchy'
end
