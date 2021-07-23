class ItemsController < ApplicationController
  # before_action :authenticate_user!, except: [:index]

  def show
    @conversations = current_user.conversations if user_signed_in?

  @item = Item.find(params[:id])
    @comments = @item.comments.sort_by(&:created_at) unless @item.nil?
  end

  def create
    user = User.find(params[:user_id])
    item = user.items.new(item_params)
    redirect_to root_path, notice: 'Listing was created succesfully' if item.save
    # this should redirect to current_user's item show page instead
  end

  def update
    item = Item.find(params[:id])
    transact = Transact.find_by(item_id: params[:id])

    if transact
      if params[:item][:status] == 'open'
        transact.delete
        item.transact_id = nil
      end
    elsif params[:item][:status] == 'traded'
      new_transact = Transact.create(item_id: params[:id], traded_with: 'chuchu', user2_id: params[:item][:buyer_id]) if params[:item][:status] == 'traded'
      item.transact_id = new_transact.id
    end

    redirect_to request.referer, notice: 'Listing was updated succesfully' if item.update(item_params)
  end

  def destroy
    item = Item.find_by(id: params[:id])
    redirect_to root_path, notice: 'Listing was deleted succesfully' if item.delete
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :status, :transact_id, images: [])
  end
end
