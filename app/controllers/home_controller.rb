require_relative '../custom_modules/.iex_token'

class HomeController < ApplicationController
  include IEXTokens
  before_action :authenticate_user!

  def index
    @client = IEX::Api::Client.new(
      publishable_token: IEXTokens.iex_api_publishable_token,
      secret_token: IEXTokens.iex_api_secret_token,
      endpoint: 'https://sandbox.iexapis.com/v1'
    )

    @symbols = @client.ref_data_symbols

    # @client = IEX::Api::Client.new

    @users = User.all
  end
end
