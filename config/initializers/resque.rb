require 'resque/server'
require 'uri'

if Rails.env.development?
  Resque.redis = Redis.new(host: 'localhost', port: '6379')
else
  uri = URI.parse(Rails.application.credentials.redis_heroku[:REDIS_URL])
  Resque.redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)
end