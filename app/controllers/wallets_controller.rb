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

        @pnl = calculate_pnl 
    end

    private

    def set_wallet
        @wallet = current_user.wallet
    end

    def calculate_pnl
        sum = @wallet.money
        @portfolio.each do | port |
            c = Coin.find(port.coin_id)
            sum +=  c.last_price * port.amount 
        end
        pnl = (sum) / 5000 * 100
        pnl.truncate(2).to_s + '%'
    end
end
