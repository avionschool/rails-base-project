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

  def update
    @agency = Agency.find(params[:id])
    if @agency.valid? && @agency.update(agency_params)
      @agency.save
      redirect_to admins_path, notice: 'Agency approved!'
    else
      redirect_back fallback_location: agencies_path, alert: @agency.errors.first
    end
  end

  private

  def agency_params
    params.require(:agency).permit(:verified_by, :approved)
  end
end
