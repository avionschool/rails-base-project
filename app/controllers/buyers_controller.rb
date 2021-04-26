class BuyersController < ApplicationController
  def index
    @forsale = BrokerStock.all
  end

  def create
    if BuyerStock.where(user_id: current_user.id).exists?(ticker: params[:ticker])
      redirect_to buyers_path, alert: 'Error Adding Stock to Portfolio, Stock Already Exists...'
    else

      @buy = BuyerStock.create(buyers_params)
      @record = Transaction.create(transactions_params)

      if @buy.save
        redirect_to buyers_path, notice: ' Successfully Added Stock to Portfolio'
      else
        redirect_to buyers_path, notice: 'Error Adding Stock to Portfolio'
      end

    end
  end

  def edit; end

  def new
    @stock = BrokerStock.find_by(id: params[:id])
    @existing = BuyerStock.where(user_id: current_user.id).exists?(ticker: @stock.ticker)
  end

  def update; end

  def show; end

  def portfolio
    @stocks = BuyerStock.where(user_id: current_user.id)
  end

  def transactions
    @transactions = Transaction.where(user_id: current_user.id)
  end

  def buyers_params
    params.permit(:user_id, :ticker, :company, :quantity, :price)
  end

  def transactions_params
    params.permit(:user_id, :broker_id, :ticker, :quantity, :price)
  end
end
