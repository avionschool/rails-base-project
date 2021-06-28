class StocksController < ApplicationController
  def index
  end

  def search
    @stock = Stock.new_lookup(params[:stock])
    render 'index'
  end
end
