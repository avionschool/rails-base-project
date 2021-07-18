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
    redirect_to root_path, notice: 'Listing was created succesfully' if item.save
    # this should redirect to current_user's item show page instead
  end

  def update
    item = Item.find_by(id: params[:id])
    redirect_to request.referer, notice: 'Listing was updated succesfully' if item.update(item_params)
  end

  def destroy
    item = Item.find_by(id: params[:id])
    redirect_to root_path, notice: 'Listing was deleted succesfully' if item.delete
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :status, images: [])
  end
end
