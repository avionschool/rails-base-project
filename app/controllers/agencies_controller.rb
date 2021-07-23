class AgenciesController < ApplicationController
  def index
    if tourist_signed_in?
      @agencies = Agency.where(approved: true).paginate(page: params[:page], per_page: 10)
    elsif admin_signed_in?
      @agencies = Agency.where(approved: false).paginate(page: params[:page], per_page: 10)
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
      UserMailer.approve_account(@agency).deliver
    else
      redirect_back fallback_location: agencies_path, alert: @agency.errors.first
    end
  end

  def destroy
    @agency = Agency.find(params[:id])
    if @agency.destroy
      redirect_to admins_path, notice: 'Agency rejected!'
      UserMailer.reject_account(@agency).deliver
    else
      redirect_back fallback_location: agencies_path, alert: @agency.errors.first
    end
  end

  private

  def agency_params
    params.require(:agency).permit(:verified_by, :approved)
  end
end
