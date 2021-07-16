class CommentsController < ApplicationController
  def comment
    item = Item.find_by(id: params[:id])
    comment = item.comments.new(comment_params)
    redirect_to item_path(item.id) if comment.save
  end

  def update
    comment = Comment.find_by(id: params[:id])
    redirect_to item_path(comment.item_id) if comment.update(comment_update_params)
  end

  def delete
    comment = Comment.find_by(id: params[:id])
    item_id = comment.item_id
    redirect_to item_path(item_id) if comment.delete
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter_id, :body)
  end

  def comment_update_params
    params.require(:comment).permit(:body)
  end
end
