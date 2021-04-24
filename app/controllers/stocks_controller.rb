class StocksController < ApplicationController
  before_action :authenticate_user! # Devise variable
  before_action :correct_user, only: [ :destroy]
  before_action :set_stock, only: [ :destroy ]

  # GET /stocks or /stocks.json
  def index
    if current_user.role == "admin"
      @stocks = Stock.all
    else
      @stocks = current_user.stocks.all
    end
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
      params.require(:stock).permit(:name, :total_price, :user_id)
    end
end