class UserStocksController < ApplicationController
  load_and_authorize_resource
  def create
    stock_query
    @user_stock = UserStock.new(user: current_user, stock: @stock)
    if @user_stock.save
      redirect_back(fallback_location: my_portfolio_path)
    else
      flash[:notice] = 'There is an error encountered please try again'
    end
  end

  def destroy
    user_stock = UserStock.find(params[:id])
    user_stock.destroy
    redirect_to marketplace_path
  end

  def my_portfolio
    @stocks = current_user.stocks.paginate(page: params[:page], per_page: 10)
  end

  def transactions; end

  def stock_query
    @stock = Stock.check_db(params[:ticker])
    return if @stock.present?

    @stock = Stock.new_lookup(params[:ticker])
    @stock.save
  end
end
