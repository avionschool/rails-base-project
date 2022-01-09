class WalletsController < ApplicationController
    before_action :set_wallet
    def index
    end

    def edit
    end

    def update
    end

    def show
        @user = User.find(@wallet.user_id)
        unless current_user.id == @user.id || current_user.admin?
            return head :forbidden
        end
        @wallet = @user.wallet
        @orders = @wallet.orders
        @coins = Coin.all
        @portfolio = @wallet.portfolios
    end

    private

    def set_wallet
        @wallet = current_user.wallet
    end

end
