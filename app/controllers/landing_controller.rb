class LandingController < ApplicationController
  def index
    @categories = Category.all
  end
end