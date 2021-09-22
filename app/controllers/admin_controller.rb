class AdminController < ApplicationController
  before_action :authenticate_user!, :require_admin

  def dashboard; end

  def pending_users
    @users = User.where(status: 0).order("created_at ASC").paginate(page: params[:page], per_page: 10)
  end

  def user_list
    @users = User.where(role: 1).order("created_at ASC").paginate(page: params[:page], per_page: 10)
  end

  def approval
    @user = User.find(params[:id])
    @user.update_attribute(:status, 1)
    UserMailer.confirmation_email(@user).deliver_later
    redirect_to pending_users_path, notice: "Successfully approve trader signup"
  end

  def remove_trader
    @user = User.find(params[:id])
    @user.destroy
    redirect_to pending_users_path, notice: "Successfully deleted #{@user.email}"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role = 1
    if @user.save
      redirect_to pending_users_path, notice: 'Successfuly Created User'
    else
      puts @user.errors.messages
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if user_params[:balance] == ""
      return @user.update(balance: 0.00)
    end

    if @user.update(user_params)
      redirect_to user_list_path
    else
      puts @user.errors.messages
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
    @user_stocks = UserStock.where(user_id: params[:id]).paginate(page: params[:page], per_page: 10)
    puts @user_stocks.inspect
  end

  def transactions
    @transactions = Transaction.all.order("created_at ASC").paginate(page: params[:page], per_page: 10)
  end

  private

  def require_admin
    return if current_user.role.zero?
    flash[:alert] = 'You are not authorized to perform this action'
    redirect_to dashboard_path
  end
    
  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :password_confirmation, :role, :balance)
  end
end
