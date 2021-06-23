class BrokersController < ApplicationController
  def show
    @broker = Broker.find(params[:id])
  end

  def edit
    @broker = Broker.find(params[:id])
  end

  def update
    @broker = Broker.find(params[:id])
    if @broker.update(broker_params)
      redirect_to root_path, notice: 'Broker was updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @broker = Broker.find(params[:id])
    @broker.destroy
    redirect_to root_path, notice: 'Broker account was deleted successfully.'
  end

  private

  def broker_params
    params.require(:broker).permit(:email, :username, :approved, :confirmable, :type)
  end
end
