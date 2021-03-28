## About

In a nutshell: an app that pings your free Heroku app to keep it awake.

Heroku free dynos will go to sleep after an hour of inactivity. Once the dyno
is asleep, loading your application can take up to 10 seconds. This app simply
pings your desired Heroku applications every 30 mins.

Heroku also caps free dyno usage so that your dyno can't be awake 24/7. This app
allows you to set a window where pinging your application is paused (your
app probably doesn't need to stay awake while you're sleeping).

This app is inspired by [Kaffeine](http://kaffeine.herokuapp.com), and was built
because Kaffeine was [broken](https://github.com/romainbutteaud/Kaffeine/issues/29) at the time.


## Installation

#### Deploy to Heroku
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/devillD-Org/heroku-pinger/tree/master)

This app uses [Heroku scheduler](https://devcenter.heroku.com/articles/scheduler).
Unfortunately, the Heroku scheduler is [not currently configurable](https://github.com/heroku/cli/issues/668)
via the 'Deploy to Heroku' button. So, once the app is deployed, you will need to do the following:
1. Go to the app overview
2. Click on 'Heroku Scheduler' and hit 'Create Job'
3. Schedule a job every hour at :00. The job should run `bundle exec rake send_pings`
4. Schedule a job every hour at :30. The job should run `bundle exec rake send_pings`

#### Manual installation
- Install Ruby `2.6.5`
- Run `bundle install` to install gems
- Set ENV vars:
  - `URLS_TO_PING`: A list of URLs to ping, delimited by '||'
  - `PAUSE_START_UTC_HOUR`: The hour of day when pinging stops (in UTC)
  - `PAUSE_END_UTC_HOUR`: The hour of day when pinging starts (in UTC)
- Run `bundle exec rackup` to start the server at http://localhost:9292
- Set a cron to run `bundle exec rake send_pings` every 30 minutes
