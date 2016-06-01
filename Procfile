web:    bundle exec rails server -p 3000
worker: bundle exec rake environment resque:work QUEUE=mailers
clock:  bundle exec rake environment resque:scheduler
mail:   mailcatcher -f
