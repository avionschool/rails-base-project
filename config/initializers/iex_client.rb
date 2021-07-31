IEX::Api.configure do |config|
    config.publishable_token = 'pk_8e56851e45654ca5a7a4c19b5557b30d ' # defaults to 
    ENV['pk_8e56851e45654ca5a7a4c19b5557b30d']
    config.endpoint = 'https://sandbox.iexapis.com/v1' # defaults to 
    'https://cloud.iexapis.com/v1'
end 