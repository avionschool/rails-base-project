class UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy, :show]

  def index
    @users = User.all
  end

  def show

  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "A user data was successfully created"
      redirect_to users_path
    else
      flash[:error] = "There are some errors encountered"
      render :new
    end

  end

  def edit_user
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "A user data  was successfully updated"
    else
      flash[:error] = "There are some errors encountered"
      render :edit
    end
  end

  def destroy
    @user.destroy

    redirect_to users_path, notice: "A user data was successfully destroyed"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name)
  end

end
