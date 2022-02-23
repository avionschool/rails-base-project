class TradersController < ApplicationController
  before_action :authenticate_trader!
  
  def index; end
end
