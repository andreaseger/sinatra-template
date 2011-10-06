#require './env'
require 'bundler'

rack_env = ENV['RACK_ENV'] || 'production'

Bundler.setup
Bundler.require(:default, rack_env)

require './service'
run Service
