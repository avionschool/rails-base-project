class PagesController < ApplicationController
  def home
    @stocks_list = Stock.most_active_stocks
  end
end
