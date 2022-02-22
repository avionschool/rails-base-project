class AdminsController < ApplicationController
    def view_traders
        @users = User.where(approved: true)
    end

    def approvals
        @users = User.where(approved: false)
    end

    def approve_trader_account
        @user = User.find(params[:id])
        @user.approved = params[:approve]
        @user.save

        if @user.save
            redirect_to admins_view_traders_path fallback_location: admins_view_traders_path, success: 'Trader Approved'
        else
            admins_view_traders_path fallback_location: admin_view_traders_path, danger: 'Trader Approval Failed'
        end

    end

    def add_trader

    end

    def create_trader

    end

    def show_trader
        @user = User.find(params[:id])
    end

    def edit_trader
        @user = User.find(params[:id])
    end

    def update_trader
        @user = User.find(params[:id])
    end

    def view_transactions
        
    end
end
