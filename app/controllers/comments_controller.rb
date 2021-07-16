class CommentsController < ApplicationController
  def create
    @article = Article.find_by(id: params[:article_id])
    @food = Food.find_by(id: params[:food_id])

    if !@article.nil?
      @comment = @article.comments.build(comment_params)
      @comment.save
      redirect_back(fallback_location: root_path)
    elsif !@food.nil?
      @comment = @food.comments.build(comment_params)
      @comment.save
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:commentor, :comment)
  end
end
