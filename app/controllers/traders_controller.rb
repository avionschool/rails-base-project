class TradersController < ApplicationController
  before_action :authenticate_trader!

  def index; end
  def show; end
end
