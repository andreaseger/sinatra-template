require_relative 'lib/helper'


class Service < Sinatra::Base
  configure do |c|
    helpers Sinatra::MyHelper

    set :public_folder, File.dirname(__FILE__) + '/public'
    set :haml, :format => :html5

    set :server, :thin

    enable :sessions
    use Rack::Flash
    layout :layout
  end

  configure :development do |c|
    register Sinatra::Reloader
    c.also_reload "./lib/**/*.rb"
  end

  configure(:test) { disable :logging }

  def cache_page(seconds=60*60)
    response['Cache-Control'] = "public, max-age=#{seconds}" unless :development
  end

  get '/' do
    logger.info "I just want to let you know: I'll take care of the request!"
    haml :foo
  end

  get '/streaming' do
    stream do |out|
      out << "It's gonna be legen -<br/>"
      sleep 0.5
      out << " (wait for it) <br/>"
      sleep 1
      out << "- dary!<br/>"
    end
  end

  app_file = "service.rb"
  run! if app_file == $0
end
