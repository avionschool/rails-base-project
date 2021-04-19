IEX::Api.configure do |config|
    config.publishable_token = 'pk_71e285da45414ea489826f34a03c1322' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
    config.secret_token = 'sk_7339d4bb3c9e4e87a49bd7ab266e990d' # defaults to ENV['IEX_API_SECRET_TOKEN']

    config.endpoint = 'https://cloud.iexapis.com/v1' # use 'https://sandbox.iexapis.com/v1' for Sandbox
  end