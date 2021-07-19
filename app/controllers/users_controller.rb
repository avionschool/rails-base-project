class UsersController < ApplicationController
  before_action :authenticate!
  def show
    @selected_user = User.find(params[:id])
    @foods = @selected_user.foods.all.sort_by(&:updated_at).reverse
  end

  def food
    @selected_user = User.find(params[:user_id])
    @food = @selected_user.foods.find(params[:id])
  end

  private

  def food_params
    params.require(:food).permit(:user_username, :name, :food_group, :caption, :recipe_url)
  end
end
