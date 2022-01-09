class WalletsController < ApplicationController
    def index
        @wallet = current_user.wallet
    end

    def edit
        @wallet = current_user.wallet
    end

    def update
        @wallet = current_user.wallet
    end

    def show
        @wallet = current_user.wallet
    end
end
