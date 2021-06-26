class BrokerStocksController < ApplicationController
  def index; end

  def create
    @broker_stock = BrokerStock.new(broker_stock_params)

    if @broker_stock.valid?
      @broker_stock.save
      redirect_to root_path, notice: 'Stock was added to the Portfolio.'
    else
      redirect_to root_path, alert: 'Unable to add'
    end
  end

  def update
    @broker_stock = BrokerStock.find(params[:id])
    if @broker_stock.update(broker_stock_params)
        redirect_to root_path, notice: 'Stock was updated successfully.'
    end
  end

  def destroy
    @broker_stock = BrokerStock.find(params[:id])
    @broker_stock.destroy
    redirect_to root_path, notice: 'Stock was removed from portfolio.'
  end

 
  def broker_stock_params
    params.require(:broker_stock).permit(:user_id, :stock_id, :companyname, :quantity, :price)
  end
end
