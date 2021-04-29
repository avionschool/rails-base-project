class BrokersController < ApplicationController
  def index
    @client = IEX::Api::Client.new(
      publishable_token:  ENV['IEX_P_PK'], # ENV['IEX_P_PK'] for production
      secret_token:  'secret_token',
      endpoint: 'https://cloud.iexapis.com/v1' # 'https://sandbox.iexapis.com/v1' for sandbox
    ) # 'https://cloud.iexapis.com/v1' for production
  end

  def new
    @stock = BrokerStock.new
    @user = current_user
  end

  def create
    if BrokerStock.exists?(ticker: params[:ticker])
      redirect_to brokers_path, alert: 'Error Adding to portfolio, Stock Already Exists...'
    else
      @stock = BrokerStock.create(brokers_params)

      if @stock.save
        redirect_to brokers_path, notice: ' Successfully Added Stock to Portfolio'
      else
        redirect_to brokers_path, notice: 'Error Adding Stock to Portfolio'
      end

    end
  end

  # def search
  #   if params[:stock].present?
  #     @stock = BrokerStock.search(params[:stock])
  #     if @stock
  #       byebug
  #       flash[:notice] = "returned"
  #     end
  #   else
  #     redirect_to brokers_path, alert: 'Blank Query'
  #   end
  # end

  def edit; end

  def update; end

  def show; end

  def portfolio
    @stocks = BrokerStock.where(user_id: current_user.id)
  end

  def transactions
    @transactions = Transaction.where(broker_id: current_user.id)
  end

  def brokers_params
    params.permit(:user_id, :ticker, :company, :price)
  end
end
