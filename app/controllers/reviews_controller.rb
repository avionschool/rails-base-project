class ReviewsController < ApplicationController
  def index
    @service = Service.find(params[:id])
    @reviews = Review.where(service_id: @service.id)
  end

  def show
  end

  def edit
    if @review.user_id == current_user.id
      @review = Review.find(params[:id])
    else
      flash[:alert] = "You cannot edit someone else's review."
      render :index
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to reviews_index_path
      flash[:notice] = 'Your review has been updated!'
    else
      flash[:alert] = @review.errors.full_messages
      render :index
    end
  end

  def new
  end

  def create
    @review = Review.create(review_params)
    @review.service_id = params[:service_id]
    @review.user_id = params[current_user.id]
    if @review.save
      flash[:notice] = 'Your review has been posted.'
      redirect_to reviews_index_path
    else
      flash.now[:alert] = @review.errors.full_messages
      render :new
    end
  end

  def delete
    if review.user_id == current_user.id
      @review = Review.find(params[:id])
      @review.destroy
      redirect_to reviews_path
      flash[:alert] = 'Review has been deleted!'
    end
  end

  private
  def review_params
    params.require(:review).permit(:title, :body, :rating)
  end
end
