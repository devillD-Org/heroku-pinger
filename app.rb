require 'sinatra'
require './lib/pinger'

class App < Sinatra::Base
  get "/" do
    if ENV["RACK_ENV"] == "production" && request.scheme == "http"
      redirect "https://#{request.host}"
      return
    end

    @sites = Pinger.sites
    @running = !Pinger.should_skip_pings
    erb :index
  end
end
