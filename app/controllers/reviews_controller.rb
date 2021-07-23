class ReviewsController < ApplicationController
  respond_to :js, :html, :json
  before_action :find_agency
  before_action :authenticate_reviewer, only: [:new, :create]

  def index
      @reviews = @agency.reviews.all
  end

  def show
      # redirect_to reviews_path(id: params[:id])
  end

  def new
      @review = Review.new
  end

  def create
      
      @review  = Review.new(review_params)
      if Review.where(agency_id: @review.agency_id, tourist_id: @review.tourist_id).first.blank?

          @review.save

          if @review.save
              redirect_to agency_path(@review.agency_id), notice: "Successfully submitted a review"
          else
              redirect_to agency_path(@review.agency_id), alert: @review.errors.full_messages.first
          end
      else
          redirect_to agency_path(@review.agency_id), alert: "Review not sent! User already sent a review to this agency"
      end
  end

  def like
      @review = Review.find(params[:id])
      tourist = Tourist.find_by_id(current_tourist.id)
      
      if params[:format] == "like"
          @review.liked_by tourist
      elsif params[:format] == "unlike"
          @review.unliked_by tourist
      end
      
  end

  private

  def find_agency
      @agency = Agency.find(params[:agency_id])
  end

  def review_params
      params.require(:review).permit(:agency_id, :tourist_id, :review, :rating)
  end

  def authenticate_reviewer
      
      unless current_user.type == "Tourist"
          
          redirect_back fallback_location: agency_path(@agency), alert: "Only Tourist can submit reviews" 
      end
      
  end
end
