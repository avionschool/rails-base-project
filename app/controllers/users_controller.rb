class UsersController < ApplicationController
  before_action :authenticate_admin!, except: :show
  def index
    @users = User.all
  end

  def show
    unless current_user.id == params[:id] || current_user.admin?
      return head :forbidden
    end
    @user = User.find(params[:id])
    @wallet = @user.wallet
    @orders = @wallet.orders
    @coins = Coin.all
    @portfolio = @wallet.portfolios
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, :flash => { :success => 'User was successfully created.' }
    else
      render :action => 'new'
    end
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      sign_in(@user, :bypass => true) if @user == current_user
      redirect_to @user, :flash => { :success => 'User was successfully updated.' }
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, :flash => { :success => 'User was successfully deleted.' }
  end

  private
  def user_params
    params.require(:user).permit(
      :email, :password, :password_confirmation, :kind,
      wallet_attributes: [:id, :money])
  end
  
end
