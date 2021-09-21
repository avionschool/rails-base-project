require 'resque/server'
require 'uri'

Resque.schedule = YAML.load_file("#{Rails.root}/config/resque_schedule.yml")

if Rails.env.development?
  Resque.redis = Redis.new(host: 'localhost', port: '6379')
else
  uri = URI.parse(URI.encode((ENV['REDIS_URL']).to_s))
  # Resque.redis = Redis.new(host: 'localhost', port: '6379')
  Resque.redis = Redis.new(host: uri.host, port: uri.port, password: uri.password)
  
end
