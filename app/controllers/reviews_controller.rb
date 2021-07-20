class ReviewsController < ApplicationController
    def new
        @review = Review.new
    end

    private

    def conversation_params
      params.require(:review).permit(:poster_id, :commenter_id, :user2_id)
    end
end
