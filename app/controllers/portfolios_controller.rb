class PortfoliosController < ApplicationController
  def new
    @market = Market.find(params[:market_id])
    @wallet = current_user.wallet
    @portfolio = current_user.portfolios.build
    @current_stock = current_user.portfolios.find_by(market_symbol: @market.name)
  end

  def create
    portfolio = current_user.portfolios.find_by(market_symbol: params[:portfolio][:market_symbol])

    portfolio_buy_sell_logic(portfolio)
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:user_id, :market_symbol, :hist_price, :units, :amount, :market_id, :transaction_type)
  end

  def portfolio_buy_sell_logic(is_available)
    case params[:portfolio][:transaction_type]
    when 'BUY'
      buy_stock(is_available)
    when 'SELL'
      sell_stock(is_available)
    end
  end

  def buy_stock(portfolio)
    @trader_wallet = current_user.wallet
    if portfolio.nil?
      @portfolio = current_user.portfolios.build(portfolio_params)
      @portfolio.units = (@portfolio.amount / @portfolio.hist_price).round(2)
      @trader_wallet.balance = @trader_wallet.balance - @portfolio.amount

      if @trader_wallet.balance.positive?
        @portfolio.save
        @trader_wallet.save
        create_buy_transaction(@portfolio.units, @portfolio.id)
        redirect_to user_portfolio_path, success: "Successfully bought #{@portfolio.market_symbol} stocks."
      else
        redirect_to user_portfolio_path, notice: 'Error processing your transaction. Please check your balance.'
      end
    else
      @portfolio = portfolio
      param_amount = params[:portfolio][:amount].to_f
      param_hist_price = params[:portfolio][:hist_price].to_f
      param_units = (param_amount / param_hist_price).round(2)
      @portfolio.units = (@portfolio.units + param_units).round(2)
      @portfolio.amount = @portfolio.amount + params[:portfolio][:amount].to_f
      @trader_wallet.balance = @trader_wallet.balance - params[:portfolio][:amount].to_f
      if @trader_wallet.balance.positive?
        @trader_wallet.save
        @portfolio.save
        create_buy_transaction(@portfolio.units, @portfolio.id)
        redirect_to user_portfolio_path, success: "Successfully bought #{@portfolio.market_symbol} stocks."
      else
        redirect_to user_portfolio_path, notice: 'Error processing your transaction. Please check your balance.'
      end
    end
  end

  def sell_stock(portfolio)
    if portfolio.nil? || (portfolio.units < params[:portfolio][:units].to_f)
      redirect_back fallback_location: user_portfolio_path, notice: 'Please check if you have enough stock for this market.'
    else
      portfolio.units = (portfolio.units - params[:portfolio][:units].to_f).round(2)
      @trader_wallet = current_user.wallet
      @trader_wallet.balance = @trader_wallet.balance + (params[:portfolio][:units].to_f * params[:portfolio][:hist_price].to_f).round(2)
      @trader_wallet.save
      portfolio.units.zero? ? portfolio.destroy : portfolio.save

      create_sell_transaction(portfolio.id)

      redirect_to user_portfolio_path, success: 'Stock sold.'

    end
  end

  def create_buy_transaction(units, id)
    Transaction.create(user_id: current_user.id, portfolio_id: id, market_symbol: params[:portfolio][:market_symbol], transaction_type: params[:portfolio][:transaction_type], hist_price: params[:portfolio][:hist_price], units: units, amount: params[:portfolio][:amount], transaction_date: DateTime.now)
  end

  def create_sell_transaction(id)
    Transaction.create(user_id: current_user.id, portfolio_id: id, market_symbol: params[:portfolio][:market_symbol], transaction_type: params[:portfolio][:transaction_type], hist_price: params[:portfolio][:hist_price], units: params[:portfolio][:units], amount: (params[:portfolio][:units].to_f * params[:portfolio][:hist_price].to_f), transaction_date: DateTime.now)
  end
end
