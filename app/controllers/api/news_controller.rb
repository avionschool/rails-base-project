module Api
  class NewsController < ApplicationController
    def index
      globalNews = News::Client.global
      render json: globalNews
    end

    def exchangeNews
      exchangeNews = News::Client.exchange
      render json: exchangeNews
    end
    
  end
end
