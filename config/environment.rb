require 'bundler'

ENV['RACK_ENV'] ||= 'development'
e = ENV['RACK_ENV']

Bundler.setup
Bundler.require(:default, e, :assets)
print "#{e}\n"

require_relative '../lib/assets.rb'