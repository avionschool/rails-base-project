class AdminController < ApplicationController
  before_action :authenticate_admin!

  def index; end

  def users
    @all_brokers = Admin.first.brokers
    @all_buyers = Admin.first.buyers
  end

  def show_broker
    @broker = Broker.find(params[:id])
  end

  def show_buyer
    @buyer = Buyer.find(params[:id])
  end

  def new_broker
    @broker = Broker.new
  end

  def new_buyer
    @buyer = Buyer.new
  end

  def create_new_broker
    @broker = Broker.new(broker_params)
    @broker.admin_id = Admin.first.id
    @broker.skip_confirmation!
    if @broker.save
      redirect_to admin_pending_accounts_path, notice: 'Broker created successfully.'
    else
      flash[:alert] = @broker.errors.full_messages.to_sentence
      render action: 'new_broker'
    end
  end

  def create_new_buyer
    @buyer = Buyer.new(buyer_params)
    @buyer.admin_id = Admin.first.id
    @buyer.skip_confirmation!
    if @buyer.save
      redirect_to admin_pending_accounts_path, notice: 'Buyer created successfully.'
    else
      flash[:alert] = @buyer.errors.full_messages.to_sentence
      render action: 'new_buyer'
    end
  end

  def edit_broker
    @broker = Broker.find(params[:id])
  end

  def edit_buyer
    @buyer = Buyer.find(params[:id])
  end

  def update_broker
    @broker = Broker.find(params[:id])
    @broker.skip_reconfirmation!
    if @broker.update(broker_params)
      redirect_to show_broker_path(@broker), notice: 'Successfully updated Broker.'
    else
      flash[:alert] = @broker.errors.full_messages.to_sentence
      render action: 'edit_broker'
    end
  end

  def update_buyer
    @buyer = Buyer.find(params[:id])
    @buyer.skip_reconfirmation!
    if @buyer.update(buyer_params)
      redirect_to show_buyer_path(@buyer), notice: 'Successfully updated Buyer.'
    else
      flash[:alert] = @buyer.errors.full_messages.to_sentence
      render action: 'edit_buyer'
    end
  end

  def transactions
    @transactions = Transaction.all
  end

  def pending_accounts
    @pending_brokers = Broker.where(confirmed_at: nil)
    @pending_buyers = Buyer.where(confirmed_at: nil)
  end

  def confirm_broker
    @broker = Broker.find(params[:id])
    @broker.confirmed_at = DateTime.current.to_date
    @broker.save
    redirect_to admin_pending_accounts_path, notice: 'Successfully confirmed broker account.'
  end

  def confirm_buyer
    @buyer = Buyer.find(params[:id])
    @buyer.confirmed_at = DateTime.current.to_date
    @buyer.save
    redirect_to admin_pending_accounts_path, notice: 'Successfully confirmed buyer account.'
  end

  private

  def broker_params
    params.require(:broker).permit(:email, :password, :broker_name)
  end

  def buyer_params
    params.require(:buyer).permit(:email, :password)
  end
end
