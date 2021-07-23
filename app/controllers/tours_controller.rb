class ToursController < ApplicationController
  before_action :authenticate_agency!, except: %i[index show]

  def index
    if agency_signed_in?
    @tours = current_agency.tours.all
    else 
      @tours = Tour.search(params[:search])
    end
    
  end

  def show
    @tour = Tour.find(params[:id])
  end

  def new
    @tour = current_agency.tours.build
  end

  def create
    @tour = current_agency.tours.build(tour_params)
    if @tour.valid?
      @tour.save
      redirect_to tours_path, notice: "Successfully created #{@tour.name} package"
    else
      redirect_back fallback_location: new_tour_path, alert: @tour.errors.full_messages.first
    end
  end

  def edit
    @tour = Tour.find(params[:id])
  end

  def update
    @tour = Tour.find(params[:id])
    if @tour.update(tour_params)
      flash[:notice] = 'tour was updated successfully.'
      redirect_to tour_path(@tour)
    else
      render 'edit'
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :price, :location, :duration, :details, images: [])
  end
end
