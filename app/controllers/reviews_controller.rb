class ReviewsController < ApplicationController
  def index
    @service = Service.find(params[:service_id])
    @reviews = @service.reviews.all
  end

  def edit
    @review = Review.find(params[:id])
    if review_owned_by_buyer?
      @review = Review.find(params[:service_id])
    else
      flash[:alert] = "You cannot edit someone else's review."
      render :index
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = 'Your review has been updated!'
      redirect_to_index
    else
      flash[:alert] = @review.errors.full_messages
      render :index
    end
  end

  def create
    @review = Review.create(review_params)
    @review.service_id = params[:service_id]
    @review.buyer_id = current_buyer.id
    if @review.save
      flash[:notice] = 'Your review has been posted.'
      redirect_to_index
    else
      flash.now[:alert] = @review.errors.full_messages
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])

    return unless review_owned_by_buyer?

    @review.destroy
    redirect_to_index
    flash[:alert] = 'Review has been deleted!'
  end

  private

  def redirect_to_index
    redirect_to service_reviews_path(service_id: @review.service_id)
  end

  def review_owned_by_buyer?
    @review.buyer_id == current_buyer.id
  end

  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end
end
