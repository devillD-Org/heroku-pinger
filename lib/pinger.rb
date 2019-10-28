require 'net/http'

class Pinger
  def self.ping(url)
    Net::HTTP.get(URI.parse(url))
  end
end
