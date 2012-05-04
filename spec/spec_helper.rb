ENV['RACK_ENV'] = 'test'
require 'bundler'
Bundler.setup
Bundler.require(:default, :test)

require_relative '../config/environment'
require_relative '../lib/models'
require_relative '../lib/db'


RSpec.configure do |config|
  config.mock_with :mocha

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.filter_run_excluding :slow => true

  config.before(:suite) do
    DatabaseCleaner[:mongoid].strategy = :truncation
  end

  config.before(:each) do
    DatabaseCleaner[:mongoid].start
  end

  config.after(:each) do
    DatabaseCleaner[:mongoid].clean
  end
end