class StocksController < ApplicationController
  def index
    @stocks = Stock.all.paginate(page: params[:page], per_page: 50)
  end

  def search
    @stock = Stock.new_lookup(params[:ticker])
    @db_stock = BuyerStock.find_by(ticker: params[:ticker])
    @action_made = params[:action_made]
    @user = User.find_by(id: session[:user_id])
    render 'show'
  end

  def show; end

  def update_stock
    Stock.delete_all
    client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:publish_access_key],
      secret_token: Rails.application.credentials.iex_client[:secret_access_key],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )
    symbols = client.ref_data_symbols
    nas_symbols = symbols.select { |symbol| symbol.exchange == 'NAS' }
    @selected_symbols = (0...nas_symbols.length).select { |x| x % 30 == 30 - 1 }.map { |y| nas_symbols[y] }

    @selected_symbols.each do |stock|
      Stock.find_or_create_by('ticker' => stock.symbol, 'company' => client.company(stock.symbol).company_name, 'change_percent' => client.quote(stock.symbol).change_percent_s, 'price' => client.price(stock.symbol))
    rescue StandardError
      # exception
    end
    redirect_to stocks_path
  end

  def transaction_buy
    @transaction = Transaction.new(buy_params)
    @user = User.find_by(id: params[:user_id])
    @buyer_stock = BuyerStock.find_by(user_id: @user.id, ticker: @transaction.ticker)
    @total_price = if @user.broker_role.downcase == 'broker'
                     discounted_price * @transaction.quantity
                   else
                     @transaction.price * @transaction.quantity
                   end
    render 'show' unless @user.money > @total_price
    render 'show' unless @transaction.save
    user_money = @user.money - @total_price
    @user.update(money: user_money)
    @user.broker_role.downcase == 'broker' ? @transaction.update(price: discounted_price.round(2)) : @transaction.update(price: @transaction.round(2))

    @transaction.update(total_price: @total_price.round(2))
    if @buyer_stock.nil?
      BuyerStock.create(stock_params)
      BuyerStock.update(total_price: @total_price)
    else
      @stock = BuyerStock.new(stock_params)
      @new_qty = @buyer_stock.quantity + @stock.quantity
      @new_total_price = (@new_qty * @stock.price).round(2)
      @buyer_stock.update(quantity: @new_qty, total_price: @new_total_price, change_percent: @stock.change_percent, price: @stock.price)
    end
    redirect_to stocks_path
  end

  def transaction_sell
    @transaction = Transaction.new(sell_params)
    @user = User.find_by(id: params[:user_id])
    @seller_stock = BuyerStock.find_by(user_id: @user.id, ticker: @transaction.ticker)
    @interest_price = @transaction.price * 1.05
    @total_price = if @user.broker_role.downcase == 'broker'
                     @interest_price * @transaction.quantity
                   else
                     @transaction.price * @transaction.quantity
                   end
    if @transaction.save
      user_money = @user.money + @total_price
      @user.update(money: user_money)
      @transaction.update(price: @interest_price.round(2)) if @user.broker_role.downcase == 'broker'
      @stock = BuyerStock.new(stock_params)
      @transaction.update(total_price: @total_price.round(2))
      @new_qty = @seller_stock.quantity - @stock.quantity
      @new_total_price = (@new_qty * @stock.price).round(2)
      @new_percent = @stock.change_percent
      @new_price = @stock.price
      @seller_stock.update(quantity: @new_qty, total_price: @new_total_price, change_percent: @new_percent, price: @new_price)
      redirect_to stocks_path
    else
      render 'show'
    end
  end

  private

  def buy_params
    params.require(:stock).permit(:company, :price, :ticker, :quantity, :buyer, :buyer_id, :seller)
  end

  def sell_params
    params.require(:stock).permit(:company, :price, :ticker, :quantity, :buyer, :broker_id, :seller)
  end

  def stock_params
    params.require(:stock).permit(:company, :price, :ticker, :quantity, :user_id, :change_percent)
  end

  def discounted_price
    @discounted_price = @transaction.price * 0.95
  end
end
