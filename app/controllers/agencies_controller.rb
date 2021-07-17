class AgenciesController < ApplicationController
  def index
    if tourist_signed_in?
      @agencies = Agency.where(approved: true)
    elsif admin_signed_in?
      @agencies = Agency.where(approved: false)
    end
  end

  def show
    @agency = Agency.find(params[:id])
    @tours = @agency.tours
  end
end
