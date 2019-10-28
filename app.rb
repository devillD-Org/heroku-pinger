require 'sinatra'
require './lib/pinger'

class App < Sinatra::Base
  get "/" do
    @sites = Pinger.sites
    @running = !Pinger.should_skip_pings
    erb :index
  end
end
