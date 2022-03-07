class MarketsController < ApplicationController
  def index
    @markets = Market.order('name asc')
  end
end
