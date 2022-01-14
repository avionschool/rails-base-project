class HomeController < ApplicationController
  def index
    # @global_news = News::Client.global
    @businessNews = Freenews::Client.business
    @healthNews = Freenews::Client.health
    @global_news = News::Client.global
  end
end
