class UsersController < ApplicationController
  load_and_authorize_resource

  def admin_home
  end 
  def index
    @users = User.approved_users.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'You have successfully created a new account'
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have successfully created a new account'
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      flash[:notice] = 'You have Successfully rejected the broker'
      WelcomeMailer.reject_account(user).deliver

    else
      flash[:alert] = 'There is something wrong please try again or submit ticket to the devs'
    end
    redirect_back(fallback_location: pending_user_path)
  end

  def pending_users
    @users = User.pending_users.paginate(page: params[:page], per_page: 10)
  end

  def approve_pending

    user = User.find(params[:id])
    if user.update(approved: true)
      flash[:notice] = 'You have Successfully approve the broker'
      WelcomeMailer.approve_account(user).deliver
    else
      flash[:alert] = 'There is something wrong please try again later'
    end
    redirect_back(fallback_location: pending_user_path)
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :role)
  end
end
