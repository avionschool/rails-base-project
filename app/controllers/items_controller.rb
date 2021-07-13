class ItemsController < ApplicationController
  def index
    @item = Item.find_by(id: params[:id])
  end

  def create
    user = User.find_by(id: params[:user_id])
    item = user.items.new(item_params)
    if item.save 
      redirect_to root_path
    end 
  end

  private

  def item_params
    params.require(:item).permit(:name,:description,:status)
  end
end
