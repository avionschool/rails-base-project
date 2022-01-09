class AdminsController < ApplicationController
    before_action :authenticate_admin!
    def index
    end
    def show
    end

    def coins
        @coins = Coin.all
    end
end
