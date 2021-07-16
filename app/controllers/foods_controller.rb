class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = current_user.foods.all.sort_by(&:updated_at).reverse
  end

  def show
    @cur_user = current_user
    @food = current_user.foods.find(params[:id])
  end

  def new
    @food = current_user.foods.build
  end

  def create
    @food = current_user.foods.build(food_params)

    if @food.valid?
      @food.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @food = current_user.foods.find(params[:id])
  end

  def update
    @food = current_user.foods.find(params[:id])

    if @food.update(food_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @food = current_user.foods.find(params[:id])
    @food.destroy

    redirect_to root_path
  end

  private

  def food_params
    params.require(:food).permit(:user_username, :name, :food_group, :caption, :recipe_url)
  end
end
