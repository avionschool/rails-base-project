class BuyOrdersController < ApplicationController
  before_action :stock_setup

  def buy
    @stock = params[:stock]
    @buy_order = BuyOrder.new(buy_params)
    @buy_order.user = current_user
    @buy_order.stock = @stock
    if buy_order.save
      buy_order.complete_order
      redirect_to dashboard_path
    else
      redirect_to search_stock_path(@stock)
    end
  end

  private

  def stock_setup
    @stock = params[:stock]
  end

  def buy_params
    params.permit(:buy_order)
  end
end