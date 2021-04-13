class ServicesController < ApplicationController
  before_action :set_supplier

  def index
    @services = Service.all
  end

  def show
    set_service
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.create(service_params)
    @service.supplier_id = current_supplier.id
    if @service.save
      flash[:notice] = 'You have successfully published your service'
      redirect_to @service
    else
      flash.now[:alert] = @service.errors.full_messages
      render :new
    end
  end

  def edit
    @service = Service.find(params[:service_id])
    if service_owned_by_supplier?
      @service = Service.find(params[:service_id])
    else
      flash[:alert] = "You cannot edit someone else's review."
      render :index
    end
  end

  def update
    set_service
    if @service.update(service_params)
      flash[:notice] = 'Your service has been updated!'
      redirect_to @supplier
    else
      flash[:alert] = @service.errors.full_messages
      render :index
    end
  end

  def destroy
    @service = Service.find(params[:id])

    return unless service_owned_by_supplier?

    @service.destroy
    redirect_to_index
    flash[:alert] = 'Service has been deleted!'
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def set_supplier
    @supplier = current_supplier
  end

  def redirect_to_index
    redirect_to supplier_services_path(supplier_id: @service.supplier_id)
  end

  def service_owned_by_supplier?
    @service.supplier_id == current_supplier.id
  end

  def service_params
    params.require(:service).permit(:name, :price, :category, :location, :supplier_id)
  end
end
