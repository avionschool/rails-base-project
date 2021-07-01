require 'pp'

class PagesController < ApplicationController
  # before_action :authenticate_user!
  before_action :authenticate_user!, except: [:home]

  def home
    @name = current_user.first_name if current_user
  end

  # Brokers and Buyers Only
  def portfolio
    case @user_type
    when 'broker'
      @portfolio = current_user.stocks.all
    when 'buyer'
      @portfolio = current_user.transactions.all
    end
  end

  # Buyers Only
  def buy
    @transaction = Transaction.find(params[:id])
  end

  def buy_stock
    @transaction = Transaction.find(params[:id])
    @purchased_stock = params[:transaction][:purchased_stock].to_i
    @transaction.amount = @transaction.amount + @purchased_stock
    return unless @transaction.save

    @ts = TransactionLog.new
    @ts.transaction_id = params[:id]
    @ts.amount_change = @purchased_stock
    @ts.save
    redirect_to pages_portfolio_path, notice: 'Stock Successfully Purchased'
  end

  def sell
    @transaction = Transaction.find(params[:id])
  end

  def sell_stock
    @transaction = Transaction.find(params[:id])
    @sold_stock = params[:transaction][:sold_stock].to_i
    return unless @sold_stock <= @transaction.amount

    @sold_stock = 0 - @sold_stock
    @transaction.amount = @transaction.amount + @sold_stock
    return unless @transaction.save

    @ts = TransactionLog.new
    @ts.transaction_id = params[:id]
    @ts.amount_change = @sold_stock
    @ts.save
    redirect_to pages_portfolio_path, notice: 'Stock Successfully Purchased'
  end

  # Transaction Logs
  def transactions
    case @user_type
    when 'admin'
      @transaction_logs = TransactionLog.all
    when 'broker'
      @transaction_logs = TransactionLog.where(transaction_id: [Transaction.where(broker_stock_id: [BrokerStock.where(user_id: current_user.id).ids]).ids])
    when 'buyer'
      @transaction_logs = TransactionLog.where(transaction_id: [Transaction.where(user_id: current_user.id).ids])
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :user_type_id, :verified)
  end

  def transaction_params
    params.require(:transaction).permit(:amount)
  end
end
