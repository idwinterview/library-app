source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '~> 4.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'pg', '~> 0.21.0' # forced version. Rails hasn't released support for 1.0 yet 
gem 'test-unit', '~> 3.0'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'rspec-rails', '~> 3.5'
  gem 'pry'
  gem 'factory_bot_rails'
  gem 'shoulda', '~> 3.5'
end

group :test do
  gem 'simplecov', require: false, group: :test
  gem 'capybara'
end
