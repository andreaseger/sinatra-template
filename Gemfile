# A sample Gemfile
source "http://rubygems.org"

gem 'sinatra', :require => 'sinatra/base'
gem 'haml'
gem 'rack-flash'

#server
gem 'thin'

group :production do
  gem 'newrelic_rpm'
end

group :development do
  gem 'sinatra-reloader', :require => 'sinatra/reloader'
  gem 'capistrano'

  gem 'compass'
  gem 'compass-susy-plugin'
  gem 'guard-compass'

  gem 'pry'
end

group :test, :development do
  gem 'rspec'
end

group :test do
  gem 'simplecov', :require => false
  gem 'mocha'
  gem 'capybara'
  gem 'factory_girl'
  gem 'guard-livereload'
  gem 'guard-rspec'
end
