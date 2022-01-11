class AdminController < ApplicationController 
    
    def user_settings 
        @users = User.where(confirmed: true)
    end

    def confirmation 
        @users = User.where(confirmed: false)
    end

    def confirm_user 
        @user = User.find(params[:id])
        @user.confirmed = params[:confirmed]
        @user.save
    end

end
