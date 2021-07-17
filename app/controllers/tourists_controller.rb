class TouristsController < ApplicationController
  before_action :authenticate_user!

  def show
    @tourist = Tourist.find(params[:id])
  end
end
