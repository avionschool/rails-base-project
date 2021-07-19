class CommentsController < ApplicationController
  before_action :authenticate!

  def create
    comment = Comment.new(comment_params)
    comment.commenter = @cur_user.username
    comment.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy

    redirect_back(fallback_location: root_path)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :food_id)
  end
end
