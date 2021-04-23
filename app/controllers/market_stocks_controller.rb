class MarketStocksController < ApplicationController
  before_action :authenticate_user! # Devise variable
  before_action :correct_user, only: [ :destroy ]
  before_action :set_stock, only: [ :destroy ]

  # POST 
  def create
    stock_presence = current_user.stocks.where(name: stock_params[:name]).count
    if stock_presence > 0
      # if data exists already, update it
      puts "already existing in Stocks model"

      @stock = current_user.stocks.find_by(name: stock_params[:name])
      price = stock_params[:quantity].to_f * params[:latest_price].to_f

      # updates stocks amount and quantity
      stock_params[:amount] = @stock.amount + price
      stock_params[:quantity] = stock_params[:quantity].to_i + @stock.quantity
      puts ""
      puts @stock
      puts ""
      puts stock_params
      puts ""
      
      @transaction = current_user.purchases.new({
        total_amount: @stock.amount ,
        quantity: stock_params[:quantity],
        price: params[:latest_price],
        seller_id: nil
      })

      ActiveRecord::Base.transaction do

        if @stock.update(stock_params)
          @transaction.stock_id = @stock.id
          result_transaction = @transaction.save
        end
        # raise ActiveRecord::Rollback
      rescue ActiveRecord::RecordInvalid => e
        @error = "Something went wrong in saving stocks and transactions!"
        redirect_to(market_path, alert: @error) and return
      end

    else
      # else create new stocks
  
      @stock = current_user.stocks.new(stock_params)
      @stock.amount = @stock.quantity.to_f * params[:latest_price].to_f

      @transaction = current_user.purchases.new({
        total_amount: @stock.amount ,
        quantity: stock_params[:quantity],
        price: params[:latest_price],
        seller_id: nil
      })

      ActiveRecord::Base.transaction do

        if @stock.save
          @transaction.stock_id = @stock.id
          result_transaction = @transaction.save
        end
        # raise ActiveRecord::Rollback
      rescue ActiveRecord::RecordInvalid => e
        @error = "Something went wrong in saving stocks and transactions!"
        redirect_to(market_path, alert: @error) and return
      end

      
    end

  
    # respond_to do |format|
    #   if @stock.save
    #     format.html { redirect_to @stock, notice: "Stock was successfully created." }
    #     format.json { render :show, status: :created, location: @stock }
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @stock.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE 
  def destroy
    @stock.destroy
    respond_to do |format|
      format.html { redirect_to stocks_url, notice: "Stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock
      @stock = Stock.find(params[:id])
    end

    def correct_user
      @stocks = current_user.stocks.find_by(id: params[:id])
      redirect_to stocks_path, notice: "Not Authorized to edit this stock" if @stocks.nil?
    end

    # Only allow a list of trusted parameters through.
    def stock_params
      params.require(:stock).permit(:name, :amount, :quantity, :user_id)
    end

    def transaction_params
      params.require(:transaction).permit(:total_amount, :quantity, :price, :stock_id, :seller_id, :buyer_id)
    end
end