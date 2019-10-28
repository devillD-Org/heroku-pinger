task :greet do
  EnvReader.sites.each { |s| Pinger.ping(s) }
end
