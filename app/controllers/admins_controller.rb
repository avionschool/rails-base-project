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
    ApproveMailer.approve_account_email(@trader.email).deliver_now
    redirect_to admins_trader_settings_path
  end

  def add_user
    @trader = User.new()
    respond_to do |format|
      format.html
      format.js 
    end
  end

  def create_user
    @trader = User.new(params.require(:user).permit(:email, :password, :confirm_password, :full_name, :username))
    @trader.save
    if @trader.save
      WelcomeMailer.welome_account_email(@trader.email).deliver_now
      redirect_back fallback_location: admins_add_user_path, success: "Successfully created a trader"
    else
      redirect_back fallback_location: admins_add_user_path, danger: "Kindly double check all information before submitting"
    end
  end

  # def transactions; end #uncomment once transaction models has been created
end
