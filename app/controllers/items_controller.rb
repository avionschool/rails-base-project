class ItemsController < ApplicationController
  # before_action :authenticate_user!, except: [:index]

  def show
    @conversations = current_user.conversations if user_signed_in?

    @item = Item.find_by(id: params[:id])
    @comments = @item.comments.sort_by(&:created_at) unless @item.nil?
  end

  def create
    user = User.find_by(id: params[:user_id])
    item = user.items.new(item_params)
    redirect_to root_path if item.save
  end

  def update
    item = Item.find_by(id: params[:id])
    redirect_to request.referrer if item.update(item_params)
  end

  def delete
    item = Item.find_by(id: params[:id])
    redirect_to root_path if item.delete
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :status)
  end
end
