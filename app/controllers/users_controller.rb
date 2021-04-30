class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :confirm]
  def index
    redirect_to dashboard_path unless current_user.admin?
    @users = User.all.order('role_id desc')
    @unconfirmed = User.unconfirmed
    render :index
  end

  def show
    render :show
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to dashboard_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    @user.send_confirmation_instructions
    redirect_to dashboard_path
  end

  def destroy; end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        @user.confirm
        format.html { redirect_to dashboard_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @user = User.new
    render :new
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params[:user][:password] == '' ? params.require(:user).permit(:name, :email, :role_id, :cash) : params.require(:user).permit(:name, :password, :email, :role_id, :password_confirmation, :cash)
  end
end
