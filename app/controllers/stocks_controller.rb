class StocksController < ApplicationController

  def stock_search
    if params[:stock].present?
      @stock = Stock.new_search(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'broker/search_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Stock ticker not found. Please enter a valid stock symbol."
          format.js { render partial: 'broker/search_result' }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a stock symbol."
        format.js { render partial: 'broker/search_result' }
      end
    end
  end
end
