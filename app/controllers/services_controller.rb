class ServicesController < ApplicationController


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
    @service = Service.new(service_params)
    if @service.save
      flash[:notice] = 'You have successfully published your service'
      redirect_to @service
    else
      flash.now[:alert] = @service.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      flash[:notice] = 'Your service has been updated!'
      redirect_to_index
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

  def redirect_to_index
    redirect_to supplier_services_path(supplier_id: @service.supplier_id)
  end

  def service_owned_by_supplier?
    @service.supplier_id == current_supplier.id
  end

  def service_params
    params.require(:service).permit(:name, :price, :category, :supplier_id)
  end
end
