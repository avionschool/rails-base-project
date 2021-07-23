class TouristToursController < ApplicationController
  before_action :authenticate_tourist!
  def index
    @tourist_tours = current_tourist.tourist_tours.all.paginate(page: params[:page], per_page: 10)
  end

  def show
    @tourist_tour = current_tourist.tourist_tours.find(params[:id])
  end

  def new
    @tour = Tour.find(params[:tour_id])
    @tourist_tour = current_tourist.tourist_tours.build
  end

  def create
    @tourist_tour = current_tourist.tourist_tours.build(tourist_tour_params)
    @tourist_tour.save
    if @tourist_tour.save
      TravelTransaction.create(tourist_tour_id: @tourist_tour.id, agency_id: @tourist_tour.tour.agency.id, total_price: @tourist_tour.amount_bought)
      redirect_to tourist_tours_path, notice: "Successfully bought  #{@tourist_tour.tour.name} package!"

    else
      redirect_to tours_path, alert: @tourist_tour.errors.full_messages.first
    end
  end

  private

  def tourist_tour_params
    params.require(:tourist_tour).permit(:tour_id, :guest_quantity, :amount_bought, :start_date, :end_date)
  end
end
