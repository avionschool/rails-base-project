class CoinsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_list, only: [:create, :edit]
    before_action :set_coin, only: [:edit, :update, :destroy]
    def index
        Coin.update_price
        @coins = Coin.all
    end

    def new
        @coin = Coin.new
    end

    def create
        @coin = Coin.new(coin_params)

        if @coin.save
            redirect_to coins_path, :flash => {:success => "#{@coin.base} successfully added"}
        else
            render :action => 'new', :flash => {:error => 'Saving unsuccessful'}
        end
    end

    def edit
    end

    def update
        if @coin.update_attributes(coin_params)
            redirect_to coins_path, :flash => {:success => "#{@coin.base} successfully updated"}
        else
            render :action => 'edit', :flash => {:error => 'Saving unsuccessful'}
        end
    end

    def destroy
        @coin.destroy
        redirect_to coins_path, :flash => {:success => 'Coin destroyed'}
    end

    private

    def set_list
        client = Coingecko::Client
        @coins_list = client.list[:data]
    end

    def coin_params
        params.require(:coin).permit(:base, :target, :coingecko_id)
    end

    def set_coin
        @coin = Coin.find(params[:id])
    end

end
