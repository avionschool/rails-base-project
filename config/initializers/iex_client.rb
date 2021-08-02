IEX::Api.configure do |config|
    config.publishable_token = 'pk_8602e5e277754e71b57e9e56bad4d6a8' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.secret_token = 'sk_bedf09f6562c479381c77a73f4788d6d' # defaults to ENV['IEX_API_SECRET_TOKEN']
    config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
  end