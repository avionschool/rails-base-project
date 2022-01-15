module Api
  class FreenewsController < ApplicationController
    def index
      business_news = Freenews::Client.business
      render json: business_news


    end

    def healthNews
      health_news = Freenews::Client.health
      render json: health_news
    end

  end
end
