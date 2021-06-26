class BrokersController < ApplicationController
  before_action :redirect

  def index
    @brokers = Broker.where(approved: false)
  end

  def show
    @broker = Broker.find(params[:id])
  end

  def new
    @broker = Broker.new
  end

  def create
    @broker = Broker.new(broker_params)
    if @broker.save
      redirect_to admin_brokers_path, notice: 'Successfully created broker!'
    else
      redirect :new, alert: @broker.errors.full_messages
    end
  end

  def edit
    @broker = Broker.find(params[:id])
  end

  def update
    @broker = Broker.find(params[:id])
    @broker.update(broker_params)
    if @broker.save
      redirect_to admins_path, notice: 'Successfully updated broker!'
    else
      redirect_to :edit, @broker.errors.full_messages
    end
  end

  private

  def broker_params
    params.require(:broker).permit(:email, :password, :approved)
  end
end

