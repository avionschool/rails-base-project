class ReviewsController < ApplicationController
    def new
        @review = Review.new
    end

    private

    def conversation_params
      params.require(:review).permit(:transact_id, :user1_id, :user2_id, :user1_score, :user2_score, :description)
    end
end
