class CoinsController < ApplicationController
    before_action :authenticate_admin!
    def index
        @coins = Coin.all
    end

    def create
        
    end

    def edit
    end
    def delete
    end
end
