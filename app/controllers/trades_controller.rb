class TradesController < ApplicationController
  before_action :find_stock, only: %i[new create]

  def new
    @trade = Trade.new
  end

  def create
    @trade = Trade.new(trade_params)
    @trade.user_id = current_user.id
    @trade.stock_code = params[:stock_code]
    @trade.price = @stock.current_price
    flash.now[:notice] = 'You have successfully bought a stock.' if @trade.save
    render :new
  end

  private

  def trade_params
    params.require(:trade).permit(
      :user_id,
      :stock_code,
      :price,
      :quantity,
      :transaction_type
    )
  end

  def find_stock
    @stock = Stock.find_by(code: params[:stock_code])
  end
end
