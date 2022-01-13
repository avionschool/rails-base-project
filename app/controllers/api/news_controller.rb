module Api
    class NewsController < ApplicationController
        def index
            globalNews = News::Client.global
            render json: globalNews

            exchangeNews = News::Client.exchange
            render json: exchangeNews
        end
    end
end