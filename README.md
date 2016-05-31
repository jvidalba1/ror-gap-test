# README

* Ruby version: 2.2.0
* Rails version: 4.2.0

### Requirements 
    Postgres
    Redis
    Ruby

##### Custom Gems
    pg
    annotate
    resque
    resque-scheduler
    resque-pool
    mailcatcher
    carrierwave
    bootstrap-sass
    better_errors
    binding_of_caller
    faker

### Setting up
- Download project from Github:
> `git clone https://github.com/jvidalba1/ror-gap-test.git`
- Start postgres
- Database configuration: Go to ror-gap-test folder and execute in the console
> `rake db:setup`
- Test suite configuration:
> `rake test`

### Run app
- In a console, go to ror-gap-test and run `mailcatcher`, after this please go to `http://127.0.0.1:1080/` in the browser, this is to see all emails sent by the application.

- Still in ror-gap-test please run `QUEUE=mailers bundle exec rake environment resque:work`, in order to start a queue where all jobs will be executed.

- In other console and placed in ror-gap-test folder, execute `rake environment resque:scheduler`.

- The last command is to start application server, in other console execute `rails server`, and go to `localhost:3000` in the browser to interact with the application.
  
