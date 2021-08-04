class MyStockController < ApplicationController
    def buy_stocks
        # byebug
        @buy_stock = MyStock.create(post_buy_stocks_params)
        # byebug
        # @buy_stock = MyStock.create(stock_count_bought: params[:mystock][:stock_count_bought].to_i, stock_price_bough: params[:mystock][:stock_price_bough].to_i, stock_name_bought: params[:mystock][:stock_name_bought])
        if @buy_stock.save
            redirect_to stock_view_index_path
        else
            redirect_to stock_view_show_path
        end
    end

    private

    def post_buy_stocks_params
        params[:mystock][:stock_price_bough] = params[:mystock][:stock_price_bough].to_f
        params[:mystock][:stock_count_bought] = params[:mystock][:stock_count_bought].to_f
        params.require(:mystock).permit(:stock_count_bought, :stock_price_bough, :stock_name_bought)
    end
end
