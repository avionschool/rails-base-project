class AdminsController < ApplicationController
  def index
    @traders = Trader.where(is_approved: true)
  end

  def for_approval
    @traders = Trader.where(is_approved: false)
  end

  def approved
    @trader = Trader.find(params[:id])
    @trader.is_approved = true
    if @trader.save
      redirect_to admin_dashboard_path, notice: 'success'
    else
      render :for_approval, notice: 'failed'
    end
  end

  def new_trader
    # create new trader but hindi pa sinesave
    @trader = Trader.new
  end

  def create_new_trader
    # sinesave yung nacreate na new trader
    @trader = Trader.new(trader_params)
    @trader.is_approved = true

    if @trader.save
      Rails.logger.debug 'nagwork ba?'
      redirect_to admin_dashboard_path, notice: 'success'
    else
      Rails.logger.debug 'failed ba?'
      render :new_trader, notice: 'failed', status: :unprocessable_entity
    end
  end

  private

  def trader_params
    params.require(:trader).permit(:username, :fullname, :email, :password)
  end
end
