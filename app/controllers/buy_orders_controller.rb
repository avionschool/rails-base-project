class BuyOrdersController < ApplicationController
  before_action :set_stock

  def buy
    @buy_order = @stock.buy_orders.build(buy_params)
    @buy_order.user = current_user
    if @buy_order.save
      @buy_order.complete_order
      redirect_to dashboard_path
    else
      redirect_to search_stock_path
    end
  end

  private

  def buy_params
    params.require(:buy_order).permit(:price, :quantity)
  end

  def set_stock
    @stock = Stock.check_stock(params[:buy_order][:stock])
  end
end