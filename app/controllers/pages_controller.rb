class PagesController < ApplicationController
    def index
        client = Coingecko::Client
        @trending = client.trending_coins[:data]
    end
    
end
