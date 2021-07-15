class ItemsController < ApplicationController
  # before_action :authenticate_user!, except: [:index]

  def show
    @conversations = current_user.conversations if user_signed_in?

    @item = Item.find_by(id: params[:id])
    @comments = @item.comments.sort_by(&:created_at).reverse
  end

  def create
    user = User.find_by(id: params[:user_id])
    item = user.items.new(item_params)
    redirect_to root_path if item.save
  end

  def comment
    item = Item.find_by(id: params[:id])
    comment = item.comments.new(comment_params)
    redirect_to item_path(item.id) if comment.save
  end

  def update_comment
    comment = Comment.find_by(id: params[:id])
    redirect_to item_path(comment.item_id) if comment.update(comment_update_params)
  end

  def delete_comment
    comment = Comment.find_by(id: params[:id])
    item_id = comment.item_id
    redirect_to item_path(item_id) if comment.delete
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :status)
  end

  def comment_params
    params.require(:comment).permit(:commenter_id, :body)
  end

  def comment_update_params
    params.require(:comment).permit(:body)
  end
end
