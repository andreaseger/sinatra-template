# A sample Gemfile
source "https://rubygems.org"

gem 'rake'
gem 'sinatra', :require => 'sinatra/base'
gem 'sinatra-contrib', :require => 'sinatra/contrib'
gem 'mustache', :require => 'mustache/sinatra'

gem 'puma'

# storage
gem 'mongoid'
gem "bson_ext"
gem 'database_cleaner'

group :assets do
  gem 'therubyracer'
  gem 'sprockets'
  gem 'coffee-script'
  gem 'sass'
  gem 'uglifier', :require => false
  gem 'compass-susy-plugin', :require => 'susy'
  gem 'compass', ">= 0.12.alpha.1", :require => false
end

group :development do
  gem 'sinatra-reloader', :require => 'sinatra/reloader'
  gem 'capistrano'
  gem 'guard-sprockets2'
end

group :development, :test do
  gem 'pry'
  gem 'pry-nav'
end

group :test do
  gem 'rspec'
  gem 'mocha'
  gem 'guard-rspec'
end