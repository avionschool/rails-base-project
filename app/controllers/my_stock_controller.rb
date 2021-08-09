class MyStockController < ApplicationController
    before_action :authenticate_user!
    # after_save :create_trans
    
    def buy_stocks
        # byebug
        @buy_stock = MyStock.new(post_buy_stocks_params)
        # byebug
        # @buy_stock = MyStock.create(stock_count_bought: params[:mystock][:stock_count_bought].to_i, stock_price_bough: params[:mystock][:stock_price_bough].to_i, stock_name_bought: params[:mystock][:stock_name_bought])
        if @buy_stock.save
            flash[:notice] = "Success: You BOUGHT a stock"
            redirect_to stock_view_my_stocks_path
        else
            redirect_to stock_view_my_stocks_path
        end

    end

    # def create_trans
    #     items = post_buy_stocks_params
    #     puts items
    # end

    def sell_stocks
        @stock = current_user.my_stocks.find_by(id: params[:id])
        @stock.destroy
        flash[:notice] = "Success: You SOLD a position"
        redirect_to stock_view_transactions_path
    end

    private

    # def create_buy_trans_to_db
    #     items = post_buy_stocks_params
    #     puts items
    # end

    def post_buy_stocks_params
        params[:mystock][:stock_price_bough] = params[:mystock][:stock_price_bough].to_f * 100
        params[:mystock][:stock_count_bought] = params[:mystock][:stock_count_bought].to_f
        params[:mystock][:user_id] = current_user.id
        params.require(:mystock).permit(:stock_count_bought, :stock_price_bough, :stock_name_bought, :user_id)
    end
end
# @foo = MyStock.new({stock_price_bough: 289.46}) 