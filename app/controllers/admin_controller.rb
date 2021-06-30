class AdminController < ApplicationController

    def users
      @buyers = User.buyers.all
      @admins = User.admins.all
      @brokers = User.brokers.where(verified: true)
      @users = User.all
    end
  
    def pending
      @pending = User.brokers.where(verified: false)
    end
  
    def edit_pending
      @user = User.find(params[:id])
    end
  
    def approve_pending
      @user = User.find(params[:id])
      redirect_to users_pending_path if @user.update(user_params)
    end

end
