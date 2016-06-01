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
    foreman
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


- Start all application processes, placed in ror-gap-test folder, execute in the console:

> `foreman start`

With this command, it executes rails server in port 3000, creates the resque worker, resque scheduler and mailcatcher, if you get an error with mailcatcher like this:

```shell
00:07:39 mail.1   | Starting MailCatcher
00:07:39 mail.1   | ~~> ERROR: Something's using port 1025. Are you already running MailCatcher?
```

you can kill the process with the following commands and after this execute again `foreman start`:

```shell
> lsof -nP -iTCP:1025 -sTCP:LISTEN

COMMAND   PID     USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
ruby    26705 jvidalba    9u  IPv4 0x53073a8fd42acf45      0t0  TCP 127.0.0.1:1025 (LISTEN)

> kill 26705
```

  
