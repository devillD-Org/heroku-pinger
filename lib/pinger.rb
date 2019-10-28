require 'net/http'

class Pinger
  def self.run
    urls_to_ping = ENV.fetch("URLS_TO_PING", "").split("||")
    pause_start_utc_hour = ENV.fetch('PAUSE_START_UTC_HOUR', -1).to_i
    pause_end_utc_hour = ENV.fetch('PAUSE_END_UTC_HOUR', -1).to_i

    unless pause_start_utc_hour < 0 || pause_end_utc_hour < 0
      current_hour = Time.now.utc.hour
      skip_pings = current_hour >= pause_start_utc_hour && current_hour <= pause_end_utc_hour
      return if skip_pings
    end

    urls_to_ping.each { |u| Net::HTTP.get(URI.parse(u)) }
  end
end
