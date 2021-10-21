class AdminPagesController < ApplicationController
  def index
    @users = User.all
  end

  def approve_user_payment
    @user = User.find(params[:id])
    @user.update(status: 1)
    flash[:notice] = 'Successfully approve user payment'
    redirect_to admins_home_path
  end
end
