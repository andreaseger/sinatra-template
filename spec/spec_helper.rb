require 'rack/test'
require 'rspec'
require 'mocha'

begin
  require_relative '../service.rb'
rescue NameError
  require File.expand_path('../service.rb', __FILE__)
end

module RSpecMixin
  include Rack::Test::Methods
  def app() Sinatra::Application end
end

RSpec.configure do |config|
  config.include RSpecMixin
  config.mock_with :mocha
end
