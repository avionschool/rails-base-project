class MarketsController < ApplicationController
  before_action :authenticate_trader!

  def index
    @markets = Market.all
  end
end
