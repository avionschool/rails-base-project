class StocksController < ApplicationController
  before_action :authenticate_user! # Devise variable
  before_action :correct_user, only: [ :destroy ]
  before_action :set_stock, only: [ :destroy ]

  # GET /stocks or /stocks.json
  def index
    if current_user.role == "admin"
      @stocks = Stock.all
    else
      @stocks = current_user.stocks.all
    end
  end

  # POST /stocks or /stocks.json
  # if not existing create else update
  def create
    @stock = Stock.new(stock_params)
    puts ""
    puts @stock.inspect
    puts params[:latest_price]
    puts ""
    @stock.user_id = current_user.id
    @stock.amount = @stock.quantity.to_f * params[:latest_price].to_f
    puts ""
    puts @stock.inspect
    puts ""
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

  # DELETE /stocks/1 or /stocks/1.json
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
      params.require(:stock).permit(:name, :quantity)
    end
end