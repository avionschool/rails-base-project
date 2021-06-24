# require_relative '../custom_modules/.iex_token'

class HomeController < ApplicationController
  #  include IEXTokens
  before_action :authenticate_user!

  def index
    @client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_publishable_token,
      secret_token: Rails.application.credentials.iex_secret_token,
      endpoint: 'https://sandbox.iexapis.com/v1'
    )

    @symbols = @client.ref_data_symbols

    # @client = IEX::Api::Client.new

    @users = User.all
  end
end
