class OrdersController < ApplicationController
  def index
    @orders = Order.all
  end

  def create
    @wallet = Wallet.find(params[:wallet_id])
    @order = @wallet.orders.build(order_params)

    if @order.save
      redirect_to @coin
    else
      render 'trades/show'
    end

  end


  private 
  
  def order_params
    params.require(:order).permit(:price, :quantity, :kind).merge(wallet_id: current_user.wallet.id)
  end
end
