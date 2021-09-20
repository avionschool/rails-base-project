class UsersController < ApplicationController
  # before_action :authenticate_user!

  def index
    @users = User.all
    @markets = Market.all
    @portfolios = Portfolio.all
  end

  # delete this once market view has been created
  # def market_index; end

  # def correct_user
  #   @user = current_user.user.find_by(id: params[:id])
  #   redirect_to users_path, notice: "Not Authorized to edit this category" if @user.nil?
  # end
end
