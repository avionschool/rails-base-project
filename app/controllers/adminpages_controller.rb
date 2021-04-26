class AdminpagesController < ApplicationController
  def index
    @pendings = User.where(role_id: 2).where(confirmed_at: nil)
  end

  def user
    @users = User.where.not(confirmed_at: nil).order('role_id ASC')
  end

  def new; end

  def create
    @user = User.create(users_params)
    if @user.save
      @user.confirm
      redirect_to admins_index_path, notice: ' Successfully added and confirmed User Account'
    else
      redirect_to admins_index_path, notice: 'Error Adding User'
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @users = User.find_by(id: params[:id])
  end

  def confirm
    @pending = User.find_by(id: params[:id])
    @pending.confirm
    UserNotifierMailer.send_signup_email(@pending).deliver
    redirect_to admins_index_path, notice: 'Account Confirmation Successful'
    # UserMailer.send_signup_email(@pending).deliver
  end

  def show; end

  def destroy; end

  private

  def users_params
    params.permit(:role_id, :firstname, :lastname, :email, :password)
  end
end
