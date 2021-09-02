# Rails app to test Sentry capture in ActiveJob (with resque backend)

Rails app to reproduce the bug with Sentry not being able to capture exceptions
from Resque based ActiveJobs.
See: https://github.com/getsentry/sentry-ruby/issues/1559

## Setup

1. Bundle install
  ```console
  $ docker-compose run --rm app bundle install
  ```
2. Update Sentry DSN in `config/initializers/sentry.rb`

## Usage

Trigger background job to perform later with

```console
$ docker-compose run --rm app bundle exec rails runner "MyJob.perform_later"
```

Run background jobs with:

```console
$ docker-compose run --rm app bundle exec rake environment resque:work QUEUE=*
```
