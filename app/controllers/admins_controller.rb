class AdminsController < ApplicationController
  before_action :authenticate_admin!

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
      ApproveMailer.approve_account(@user.email).deliver_now
      redirect_to admins_view_traders_path fallback_location: admins_view_traders_path, success: 'Trader Approved'
    else
      admins_view_traders_path fallback_location: admin_view_traders_path, danger: 'Trader Approval Failed'
    end
  end

  def add_trader
    @user = User.new
  end

  def create_trader
    @user = User.new(params.require(:user).permit(:email, :password, :fullname))
    @user.approved = true

    if @user.save
      ApproveMailer.approve_account(@user.email).deliver_now
      redirect_to admins_add_trader_path, success: 'Trader Created Successfully'
    else
      render :add_trader, status: :unprocessable_entity, danger: 'Error processing your request.'
    end
  end

  def show_trader
    @user = User.find(params[:id])
  end

  def edit_trader
    @user = User.find(params[:id])
  end

  def update_trader
    @user = User.find(params[:id])
    @user.update(params.require(:user).permit(:email, :fullname))
    @wallet = @user.wallet
    @wallet.balance = params[:user][:balance]
    @wallet.save

    if @user.update(params.require(:user).permit(:email, :fullname)) && @wallet.save
      redirect_to trader_profile_path, success: 'Trader Updated Successfully'
    else
      render :edit_trader, status: :unprocessable_entity, danger: 'Error updating user account'
    end
  end

  def view_transactions
    @transactions = Transaction.all.order(transaction_date: :desc)
  end
end
