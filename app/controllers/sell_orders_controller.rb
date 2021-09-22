class SellOrdersController < ApplicationController

  def sell
    @sell_order = SellOrder.new(sell_params)
    @sell_order.user = current_user
    if @sell_order.save
      @sell_order.complete_order
      redirect_to dashboard_path
    else
      redirect_to search_stock_path(@stock)
    end
  end

  private

  def stock_setup
    @stock = Stock.check_stock(resource[:stock])
    if @stock.blank?
      @stock = Stock.new_lookup(resource[:stock])
      @stock.save
    else
      @stock
    end
  end

  def sell_params
    params.require(:sell_order).permit(:price, :quantity, :stock)
  end

  def resource
    params[:sell_order]
  end
end