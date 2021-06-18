require_relative '../custom_modules/.iex_token'

class HomeController < ApplicationController
  include IEXTokens
  def index
    # @client = IEX::Api::Client.new(
    #   publishable_token: ENV.fetch('IEX_API_PUBLISHABLE_TOKEN', false),
    #   secret_token: ENV.fetch('IEX_API_SECRET_TOKEN', false),
    #   endpoint: 'https://sandbox.iexapis.com/v1'
    # )

    @client = IEX::Api::Client.new(
      publishable_token: IEXTokens.iex_api_publishable_token,
      secret_token: IEXTokens.iex_api_secret_token,
      endpoint: 'https://sandbox.iexapis.com/v1'
    )

    # @client = IEX::Api::Client.new
  end
end
