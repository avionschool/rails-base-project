class UsersController < ApplicationController
  skip_before_action :authorized, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to dashboard_path
    else
      redirect_to '/users/new'
    end
  end

  def details
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.update(update_params)
    redirect_to users_details_path(id: @user.id)
  end

  def request_status
    users = User.find_by(id: params[:id])
    users.update(status: 'pending')
    redirect_to '/dashboard'
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :role, :money, :broker_role, :status, :first_name, :last_name)
  end

  def update_params
    params.require(:user).permit(:first_name, :last_name)
  end

  def broker_params
    params.require(:user).permit(:broker_role)
  end
end
