require 'yaml'
db = YAML.load_file('config/mongo.yml')[ENV['RACK_ENV'] || 'development']

Mongoid.configure do |config|
  name = db['name']
  host = db['host']
  port = db['port']
  config.database = Mongo::Connection.new.db(name)
end