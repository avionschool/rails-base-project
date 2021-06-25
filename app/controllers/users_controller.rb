class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save 
      session[:user_id] = @user.id
      if @user.role.downcase == "buyer"
        redirect_to '/dashboard_buyer' 
      elsif @user.role.downcase == "broker"
        @user.update(status:"pending")
        redirect_to root_path
      elsif @user.role.downcase == "admin"
        redirect_to '/dashboard_admin' 
      end
    else
      render :new
    end 
  end

private

  def user_params
    params.require(:user).permit(:email,:username,:password,:role,:money,:status)
  end
end
