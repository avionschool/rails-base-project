class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      case @user.role.downcase
      when 'buyer'
        redirect_to '/dashboard'
      when 'admin'
        redirect_to '/dashboard_admin'
      end
    else
      render :new
    end
  end

  def details
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(user_params)
    redirect_to users_details_path(id: @user.id)
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :role, :money, :buyer_role, :status, :first_name, :last_name)
  end
end
