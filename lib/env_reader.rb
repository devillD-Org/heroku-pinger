class EnvReader
  def self.sites
    return [] if ENV['SITES'].nil?
    ENV['SITES'].split("||")
  end
end
