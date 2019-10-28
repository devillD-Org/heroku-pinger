require 'net/http'

class Pinger
  def self.run
    return if should_skip_pings
    sites.each { |u| Net::HTTP.get(URI.parse(u)) }
  end

  def self.sites
    ENV.fetch("URLS_TO_PING", "").split("||")
  end

  def self.should_skip_pings
    pause_start_utc_hour = ENV.fetch('PAUSE_START_UTC_HOUR', -1).to_i
    pause_end_utc_hour = ENV.fetch('PAUSE_END_UTC_HOUR', -1).to_i
    return false if pause_start_utc_hour < 0 || pause_end_utc_hour < 0
    current_hour = Time.now.utc.hour
    current_hour >= pause_start_utc_hour && current_hour <= pause_end_utc_hour
  end
end
