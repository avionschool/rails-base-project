class MarketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @markets = Market.order('name asc')
  end
end
