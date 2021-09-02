# This file is similar to what is in Resque's README.
# See: https://github.com/resque/resque#configuration

Resque.redis = ENV.fetch("REDIS_URL") { "redis://localhost:6379/1" }

