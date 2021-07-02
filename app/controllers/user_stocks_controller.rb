class UserStocksController < ApplicationController
  load_and_authorize_resource

  def order
    @order_params = order_params(params[:user_stocks])
    stock_query(@order_params[:ticker])
    @total_price = @order_params[:total_price].to_d
    @brokerage_fee = @order_params[:order_price] * (@order_params[:brokerage_fee] / 100)
    @user_cash = current_user.cash if current_user.buyer?
    if current_user.stock_already_tracked?(@order_params[:ticker])
      @user_stock = current_user.user_stocks.find_by(stock_id: @stock.id)
      if @order_params[:transactiontype] == 'sell' && @order_params[:quantity].to_i == @user_stock.total_shares.to_i
        destroy
      else
        update
      end
    elsif @order_params[:transactiontype] == 'buy'
      create
    else
      flash[:alert] = "Unsuccessfull Transaction.#{@stock.name} was not found on Your Portfolio"
      redirect_to 'new'
    end
  end

  def new
    client_sb = Stock.sandbox_api
    @user_stock = UserStock.new
    @broker_buyer_stock = UserStock.find_by(id: params[:id])
    @type = params[:transactiontype]
    @stock = @broker_buyer_stock.stock
    if !current_user.stock_already_tracked?(@stock.ticker) && @type == 'sell'
      flash[:alert] = 'You Dont Have that Stock'
      redirect_to marketplace_path
    end
    @stock.update(last_price: client_sb.price(@stock.ticker))
    if !stock_valid?(@broker_buyer_stock)
      flash[:alert] = 'Stock is currently unavailable'
      redirect_to marketplace_path
    elsif @broker_buyer_stock.user.broker?
      @broker_stock = @broker_buyer_stock
      @broker = @broker_stock.user
      @available_qty = UserStock.where(stock: @broker_stock.stock, user: current_user).first&.total_shares
    elsif @broker_buyer_stock.user == current_user
      @broker_stock = nil
      @broker = @stock.users.broker.first
      @available_qty = @broker_buyer_stock.total_shares
    end
    @max_qty = (current_user.cash / ((@broker.brokerage_fee / 100) * @stock.last_price + @stock.last_price)).to_i
  end

  def create
    if current_user.buyer?
      unless current_user.update(cash: @user_cash - @order_params[:total_price])
        flash[:alert] = 'Insufficient funds to Execute Trade'
        redirect_back(fallback_location: my_portfolio_path)
        return
      end
      @user_stock = UserStock.new(user: current_user, stock: @stock, average_price: @order_params[:price], total_shares: @order_params[:quantity])
      if @user_stock.save
        save_transaction
        flash[:notice] = 'Successfull Transaction'
        redirect_to my_portfolio_path
      else
        @broker = User.find_by(id: @oder_params[:broker_id])
        flash[:alert] = 'unsuccessfull Transaction'
        redirect_back(fallback_location: my_portfolio_path)
      end
    else
      stock_query(params[:ticker])
      @user_stock = UserStock.new(user: current_user, stock: @stock)
      if @user_stock.save
        redirect_back(fallback_location: my_portfolio_path)
      else
        flash[:notice] = 'There is an error encountered please try again'
      end
    end
  end

  def destroy
    if current_user.buyer?
      unless current_user.update(cash: (@user_cash + @order_params[:total_price]))
        flash[:alert] = 'Something is wrong with your request please try again'
        redirect_back(fallback_location: my_portfolio_path)
      end
      @user_stock.destroy
      save_transaction
      flash[:notice] = 'Successfull Transaction'
      redirect_to my_portfolio_path
    else
      user_stock = UserStock.find(params[:id])
      user_stock.destroy
      redirect_back(fallback_location: my_portfolio_path)

    end
  end

  def update
    case @order_params[:transactiontype]
    when 'buy'
      total_shares = @user_stock.total_shares + @order_params[:quantity].to_d
      total_equity = ((@user_stock.average_price * @user_stock.total_shares) + @total_price)
      average_price = total_equity / total_shares
      user_cash = @user_cash - @order_params[:total_price]
    when 'sell'
      total_shares = @user_stock.total_shares - @order_params[:quantity].to_d
      average_price = @user_stock.average_price
      user_cash = @user_cash + @order_params[:total_price]
    end
    unless current_user.update(cash: user_cash)
      flash[:alert] = 'Insufficient funds to Execute Trade'
      redirect_back(fallback_location: my_portfolio_path)
      return
    end
    if @user_stock.update(average_price: average_price, total_shares: total_shares)
      save_transaction
      flash[:notice] = 'Successfull Transaction'
      redirect_to my_portfolio_path
    else
      flash[:alert] = 'An error is encounter while procesing your order please try again'
      redirect_back(fallback_location: my_portfolio_path)
    end
  end

  def my_portfolio
    @tracked_stocks = current_user.stocks.paginate(page: params[:page], per_page: 10)
    @user_stocks = current_user.user_stocks
    @tracked_stocks.each do |stock|
      Stock.update_price(stock.ticker)
    end
  end

  def transactions
    if current_user.buyer?
      @transactions = current_user.buyer_transactionrecords
    elsif current_user.broker?
      @transactions = current_user.broker_transactionrecords
    else
      current_user.admin?
      @transactions = Transactionrecord.all
    end
  end

  def stock_query(ticker)
    @stock = Stock.check_db(ticker)
    return if @stock.present?

    @stock = Stock.new_lookup(ticker)
    if @stock.save
      @stock
    else
      flash[:alert] = 'unsuccessfull Transaction'
      if current_user.broker?
        redirect_to marketplace_path
      else
        redirect_back(fallback_location: my_portfolio_path)
      end
    end
  end

  def order_params(params)
    { quantity: params[:quantity],
    price: params[:stock_price],
    broker_id: params[:broker_id],
    transactiontype: params[:type],
    ticker: params[:ticker],
    order_price: params[:order_price].to_i,
    total_price: params[:total_price].to_i,
    brokerage_fee: params[:brokerage_fee].to_f }
  end

  def save_transaction
    transaction = Transactionrecord.new(stock_price: @order_params[:price], quantity: @order_params[:quantity], total_price: @total_price, stock: @stock, buyer_id: current_user.id, broker_id: @order_params[:broker_id], transaction_type: @order_params[:transactiontype], brokerage_fee: @brokerage_fee)
    transaction.save
  end

  def stock_valid?(stock)
    stock && (stock.user.broker? || stock.user == current_user)
  end
end
