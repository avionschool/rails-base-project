class MarketsController < ApplicationController
  def index
    @sample_stocks = SampleStock.all
  end
end
