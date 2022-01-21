# Rails app to test Sentry capture in ActiveJob (with resque backend)

Rails app to reproduce the bug with Sentry not being able to capture exceptions
from Resque based ActiveJobs.
See: https://github.com/getsentry/sentry-ruby/issues/1559

## Setup

1. Configure docker base image: The `Dockerfile` is created for Apple Silicon.
If you are using an Intel or AMD chip, Open `Dockerfile` and change
the first line:

    ```
    # For arm (Apple Silicon)
    FROM rubylang/ruby:2.7.4-bionic-arm64

    # For amd
    FROM rubylang/ruby:2.7.4-bionic
    ```

2. Build the docker images:

    ```console
    $ docker-compose build app
    $ docker-compose build app_server
    ```

3. Bundle install
  ```console
  $ docker-compose run --rm app bundle install
  ```
4. Create and migrate database
  ```console
  $ docker-compose run --rm app bundle exec rails db:setup
  $ docker-compose run --rm app bundle exec rails db:migrate
  ```
5. Start Rails server:
  ```console
  $ docker-compose up app_server
  ```
6. Visit http://localhost:3000/image_files


## Usage

Start Rails server with:

```console
docker-compose run --rm app bundle exec rails server
```

Rails console with

```console
docker-compose run --rm app bundle exec rails console
```

Should you need to access `bash` inside the container:

```console
$ docker-compose run --rm app bash
```
