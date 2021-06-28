class AdminsController < ApplicationController
  def index; end

  def show
    @admin = Admin.find(params[:id])
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      redirect_to root_path, notice: 'Admin was updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    redirect_to root_path, notice: 'Admin account was deleted successfully.'
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
    if @broker.save
      redirect_to admin_users_path, notice: 'Broker created successfully.'
    else
      flash[:alert] = @broker.errors.full_messages.to_sentence
      render action: 'new_broker'
    end
  end

  def create_new_buyer
    @buyer = Buyer.new(buyer_params)
    @buyer.admin_id = Admin.first.id

    if @buyer.save
      redirect_to admin_users_path, notice: 'Buyer created successfully.'
    else
      flash[:alert] = @buyer.errors.full_messages.to_sentence
      render action: 'new_buyer'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:email, :username, :approved, :confirmable, :type)
  end

  def broker_params
    params.require(:broker).permit(:email, :username, :approved, :confirmable, :type)
  end

  def buyer_params
    params.require(:buyer).permit(:email, :username, :approved, :confirmable, :type)
  end
end
