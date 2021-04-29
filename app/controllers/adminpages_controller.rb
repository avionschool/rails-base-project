class AdminpagesController < ApplicationController
  def index
    @pendings = User.where(role_id: 2).where(confirmed_at: nil)
  end

  def user
    @users = User.where.not(confirmed_at: nil).order('role_id ASC')
  end

  def new; end

  def create
    @user = User.new(users_params)
    @user.skip_confirmation!
    @user.skip_confirmation_notification!
    if @user.save
      redirect_to admins_index_path, notice: ' Successfully added and confirmed User Account'
    else
      redirect_to new_adminpage_path, alert: 'Error Adding User, Email Already Exists and/or there are missing/incomplete fields'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])

    @user.update(users_update_params)

    redirect_to admins_user_path, notice: ' Successfully Update User Details' if @user.save
  end

  def confirm
    @pending = User.find_by(id: params[:id])
    @pending.confirm
    UserNotifierMailer.send_signup_email(@pending).deliver
    redirect_to admins_index_path, notice: 'Account Confirmation Successful'
  end

  def show; end

  def destroy; end

  def transactions
    @transactions = Transaction.all
  end

  private

  def users_params
    params.permit(:role_id, :firstname, :lastname, :email, :password)
  end

  def users_update_params
    params.permit(:role_id, :firstname, :lastname, :email, :password)
  end
end
