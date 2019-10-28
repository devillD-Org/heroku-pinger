## About

In a nutshell: an app that pings your free Heroku app to keep it awake.

Heroku free dynos will go to sleep after an hour of inactivity. Once the dyno
is asleep, loading your application can take up to 10 seconds. This app simply
pings your desired Heroku applications every 30 mins.

Heroku also caps free dyno usage so that your dyno can't be awake 24/7. This app
allows you to set a window where pinging your application is paused (your
app probably doesn't need to stay awake while you're sleeping).

This app is inspired by [Kaffeine](http://kaffeine.herokuapp.com), and was built
because Kaffeine was broken at the time.


## Installation

#### Deploy to Heroku
This app uses [Heroku scheduler](https://devcenter.heroku.com/articles/scheduler). Note
that this spins up a [one-off dyno](https://devcenter.heroku.com/articles/one-off-dynos)
which is not free.


[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/inoda/heroku-pinger/tree/master)

#### Manual installation
- Install Ruby `2.6.0`
- Run `bundle install` to install gems
- Set ENV vars:
  - `URLS_TO_PING`: A list of URLs to ping, delimited by '||'
  - `PAUSE_START_UTC_HOUR`: The hour of day when pinging stops (in UTC)
  - `PAUSE_END_UTC_HOUR`: The hour of day when pinging starts (in UTC)
- Run `bundle exec rackup` to start the server at http://localhost:9292
- Set a cron to run `bundle exec rake send_pings` every 30 minutes
