class ItemsController < ApplicationController
  # before_action :authenticate_user!, except: [:index]

  def index
    @user = User.find_by(id: params[:user_id])
    @item = Item.find_by(id: params[:id])
    @comments = Comment.where(item_id: @item.id).sort_by(&:updated_at).reverse
  end

  def create
    user = User.find_by(id: params[:user_id])
    item = user.items.new(item_params)
    redirect_to root_path if item.save
  end

  def comment
    item = Item.find_by(id: params[:id])
    comment = item.comments.new(comment_params)
    redirect_to root_path if comment.save
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :status)
  end

  def comment_params
    params.require(:comment).permit(:commenter_id, :body)
  end
end
