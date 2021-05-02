class TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[update destroy]
  def index
    @listings = Transaction.available_listings.where.not(user_id: current_user.id).order('created_at desc')
    @listings = Transaction.sell_listings.where.not(user_id: current_user.id).order('created_at desc') if params[:type] == 'sell'
    @listings = Transaction.buy_listings.where.not(user_id: current_user.id).order('created_at desc') if params[:type] == 'buy'
    @listings = Transaction.available_listings.where(user_id: current_user.id).order('created_at desc') if params[:type] == 'own'
    @top10 = Stock.most_active
    # @ql = @listings.ransack(params[:ql])
    @q = Stock.ransack(params[:q])
    render :index
  end

  def show
    @top10 = Stock.most_active
    current_user.admin? ? (@transactions = Transaction.all.order('created_at desc')) : (@transactions = Transaction.where(user_id: current_user.id).order('created_at desc'))
    render :show
  end

  def new
    render :new
  end

  def create
    case params[:transaction_type]
    when 'Buy'
      if current_user.buy_stock(Stock.find(params[:stock_id]).code, params[:volume].to_i, params[:price].to_f)
        redirect_to dashboard_path, notice: 'Successfully posted Buy Order!'
      else
        redirect_to dashboard_path, danger: 'Something went wrong.'
      end
    when 'Sell'
      if current_user.sell_stock(Stock.find(params[:stock_id]).code, params[:volume].to_i, params[:price].to_f)
        redirect_to dashboard_path, notice: 'Successfully posted Sell Order!'
      else
        redirect_to dashboard_path, danger: 'Something went wrong.'
      end
    end
  end

  def update
    if current_user.process_transaction(@transaction, params[:volume].to_i)
      redirect_to marketplace_path, notice: 'Successfully processed transaction'
    else
      redirect_to marketplace_path, danger: 'Something went wrong.'
    end
  end

  def destroy
    if @transaction.cancel_transaction
      redirect_to marketplace_path, notice: 'Cancelled transaction successfully!'
    else
      redirect_to marketplace_path, danger: 'Something went wrong!'
    end
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
  end

  def transaction_params
    params.require(:transaction).permit(:volume, :user_id, :stock_id, :price, :fulfilled, :transaction_type, :type)
  end
end
