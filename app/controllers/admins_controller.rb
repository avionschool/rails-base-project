class AdminsController < ApplicationController
  before_action :set_user, only: [:edit_user, :update_user, :destroy, :show_user]

  def index
    @users = User.all
  end

  def show_user
  end

  def new_user
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "A user data was successfully created"
      redirect_to admin_root_path
    else
      flash[:error] = "There are some errors encountered"
      render :new_user
    end

  end

  def edit_user
  end

  def update_user
    if @user.update(user_params)
      redirect_to admin_root_path, notice: "A user data  was successfully updated"
    else
      flash[:error] = "There are some errors encountered"
      render :edit_user
    end
  end

  def destroy
    @user.destroy
    redirect_to admin_root_path, notice: "A user data was successfully destroyed"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
