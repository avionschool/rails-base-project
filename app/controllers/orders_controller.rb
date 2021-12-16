class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def create
    byebug
    # @coin = Coin.find(params[:id])
    @order = @coin.orders.build(order_params)
    @order.wallet = current_user.wallet


    if @order.save
      redirect_to @coin
    else
      render :show
    end

    
  end


  private 
  
  def order_params
    params.require(:order).permit(:price, :quantity, :kind).merge(wallet_id: current_wallet.id)
  end
end
