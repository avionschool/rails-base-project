class SellOrdersController < ApplicationController
  before_action :set_stock

  def sell
    @sell_order = @stock.sell_orders.build(sell_params)
    @sell_order.indicator = 'SELL'
    @sell_order.user = current_user
    if @sell_order.save
      @sell_order.complete_order
      redirect_to dashboard_path
    else
      redirect_to search_stock_path
    end
  end

  private

  def sell_params
    params.require(:sell_order).permit(:price, :quantity)
  end

  def set_stock
    @stock = Stock.check_stock(params[:sell_order][:stock])
  end
end
