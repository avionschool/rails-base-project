class HomeController < ApplicationController
  before_action :authenticate!
  def index
    @nut = Nutritionist.where(approved: false)
  end

  def approve
    doctor = Nutritionist.find(params[:id])
    doctor.approved = true
    doctor.save
    DoctorMailer.new_nutritionist_account_approved(doctor).deliver
    @success = "Doctor's registration approved!"
    redirect_to root_path, notice: @success
  end

  private

  def authenticate!
    if user_signed_in?
      @cur_user = current_user
      :authenticate_user!
    elsif nutritionist_signed_in?
      @cur_user = current_nutritionist
      :authenticate_nutritionist!
    elsif admin_signed_in?
      @cur_user = current_admin
      :authenticate_admin!
    else
      :authenticate_user!
    end
  end
end
