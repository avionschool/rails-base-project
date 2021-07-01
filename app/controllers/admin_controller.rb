class AdminController < ApplicationController

    def users
      @buyers = User.buyers.all
      @admins = User.admins.all
      @brokers = User.brokers.all
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

    def show
      @user = User.find(params[:id])
    end

end
