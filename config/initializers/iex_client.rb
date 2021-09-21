IEX::Api.configure do |config|
  config.publishable_token = ENV['IEX_API_PUBLISHABLE_TOKEN']
  config.secret_token = ENV['IEX_API_SECRET_TOKEN']
  config.endpoint = 'https://sandbox.iexapis.com/v1'
end
