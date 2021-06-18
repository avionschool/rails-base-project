class AdminsController < ApplicationController
  before_action :redirect
  def index
    @admins = Admin.all
    @brokers = Broker.all
    @buyers = Buyer.all
  end

  def new; end

  def create
    @admin = Admin.new(admin_register_params)

    if @admin.save
      redirect_to admins_path, notice: 'Successfully created new Admin!'
    else
      redirect_to admins_new_path, alert: @admin.errors.full_messages.first
    end
  end

  protected

  def redirect
    redirect_to admins_sign_in_path unless admin_logged_in?
  end
end
