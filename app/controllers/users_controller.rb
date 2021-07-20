class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @conversations = current_user.conversations
  end

  def history
    @user = User.find(params[:id])
  end

  # def user_params
  #     params.require(:user).permit()
  # end
end
