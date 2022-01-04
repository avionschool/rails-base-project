class CoinsController < ApplicationController
    before_action :authenticate_admin!, only[:edit, :create, :delete]
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
