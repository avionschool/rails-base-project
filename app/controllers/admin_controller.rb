class AdminController < ApplicationController 
    
    def client_list 
        @users = User.where(confirmed: true)
    end

    def confirmation 
        @users = User.where(confirmed: false)
    end

    def confirm_user 
        @user = User.find(params[:id])
        @user.confirmed = params[:confirmed]
        @user.save
        if @user.save
            redirect_to admin_user_settings_path,
            notice: "User successfully confirmed"
        else 
            flash[:notice] = "User confirmation failed"
        end
    end

    def add_user 
        @user = User.new
        respond_to do |format|
            format.html
            format.js
        end
    end

    def create_user 
        @user = User.new(params.require(:user).permit(:email, :password, :confirm_password, :username))
        @user.save
        if @user.save
            redirect_to admin_confirmation_path,
            notice: "Successfully created a new user account"
        else
            redirect_to admin_confirmation_path,
            notice: "There was an error on creating the account"
        end
    end

    def show_user 
        @tradelogs = TradeLog.where(user_id: (params[:id]))
        @user = User.find(params[:id])
        respond_to do |format|
            format.html
            format.js
        end
    end

    def edit_user 
        @user = User.find(params[:id])
        respond_to do |format|
            format.html
            format.js
        end
    end

    def modify_user 
        @user = User.find(params[:id])
        @user.update(params.require(:user).permit(:email, :username))
        @wallet = @user.wallet
        @wallet.balance = params[:user][:balance]
        @wallet.save
        if @user.update(params.require(:user).permit(:email, :username)) && @wallet.save
            redirect_to admin_confirmation_path,
            notice: "User successfully modified"
        else
            redirect_to admin_confirmation_path,
            notice: "There was an error on modifying the account"
        end
    end

    def log_book
        @tradelogs = TradeLog.all
    end
end
