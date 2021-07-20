class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
    @conversations = current_user.conversations if user_signed_in?
    @item = Item.find(params[:item_id])
    @user1 = @item.user                             # user1 is the item owner ('seller')
    @transact = Transact.find(params[:transact_id])
    @user2 = User.find(@transact.user2_id)           # user2 is the one who availed the item ('buyer')
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to root_path, notice: 'Review was submitted succesfully.'
    else
      redirect_to request.referer, alert: 'Review failed to submit.'
    end
  end

  private

  def review_params
    params.require(:review).permit(:transact_id, :user1_id, :user2_id, :user1_score, :user2_score, :description)
  end
end
