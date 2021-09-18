class AdminsController < ApplicationController
  def trader_settings
    @traders = User.where(approved: true)
  end

  def approvals
    @traders = User.where(approved: false)
  end

  #patch method
  def approve_account
    @trader = User.find(params[:id])
    @trader.update_attribute :approved, params[:approve]
    redirect_to admins_trader_settings_path
  end

  # def transactions; end #uncomment once transaction models has been created
end
